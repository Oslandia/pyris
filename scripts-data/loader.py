"""Script to load data into the database

* shapefile files
* CSV files

You must have a 'dataversion.ini' file

Usage:

    > python loader.py [PATH]
    > python loader.py [PATH] --insee
    > python loader.py [PATH] --ign

Where [PATH] is the data directory
"""

import argparse
import configparser
import os
import sys
from pathlib import Path
from subprocess import DEVNULL, PIPE, CalledProcessError, run

settings = configparser.ConfigParser(allow_no_value=True)
_here = Path(__file__).parent


if 'PYRIS_SETTINGS' in os.environ:
    filename = Path(os.environ['PYRIS_SETTINGS'])
    if not filename.is_file():
        print("ERROR: environment variable PYRIS_SETTINGS is not a file: {}".format(filename))
        sys.exit(1)
    settings.read(filename)
elif (_here / 'settings.ini').exists():
    settings.read(str(_here / 'settings.ini'))
else:
    print('ERROR: you must have a settings.ini configuration file')
    sys.exit(1)
dbconf = settings['database']


# remove NOTICE messages from the stderr
psql_cmd = ["PGOPTIONS='--client-min-messages=warning'"]

if 'pg_password' in dbconf and dbconf.get('pg_password', None):
    psql_cmd.append('PGPASSWORD="{}"'.format(dbconf['pg_password']))

psql_cmd.append('psql')
# exit if a psql error occurred.
psql_cmd.append('-v ON_ERROR_STOP=1')
psql_cmd.extend([
    '{} {}'.format(opt, dbconf[cfg])
    for opt, cfg in
    (
        ('-h', 'pg_host'),
        ('-p', 'pg_port'),
        ('-d', 'pg_name'),
        ('-U', 'pg_user'),
    )
    # the option must be present and non empty
    if cfg in dbconf and dbconf.get(cfg, None)
])

shp2pgsql_cmd = [
    'shp2pgsql',
    '-W UTF8',
    '-D',
    '-g geom',
    '-I'  # index gist
]


def load_insee_csv(csv, tablename, sep=","):
    """Load a CSV file into your db

    Get the SQL file dedicated to the CSV file.

    The related SQL filename must have the name of the table which will be created.
    """
    create_schema_if_not_exists("insee")
    census = retrieve_census(tablename)
    sqlfile = _here / 'sql' / resolve_insee_sqlfile(tablename)
    if not sqlfile.exists():
        print('WARN: SQL file related to {} does not exist'.format(csv))
        return

    # you replace some content in the SQL file:
    #  - census
    #  - path to the CSV file to load
    #  - delimiter (, or ;)
    sqlcontent = sqlfile.open().read().format(
        census=census,
        fpath=csv.resolve(),
        sep=sep)
    try:
        run(
            ' '.join(psql_cmd),
            input=bytearray(sqlcontent, 'UTF-8'),
            check=True,
            shell=True,
            stdout=DEVNULL,
            stderr=PIPE)
    except CalledProcessError as exc:
        print('ERROR on', csv, exc.stderr)
        raise exc
    print('* file {csv.name} loaded'.format(**locals()))


def create_schema_if_not_exists(name):
    try:
        # remove the table if it exists. You don't thank the SHP2PGSQL command with the -d option.
        create = ["-c 'create schema if not exists {}'".format(name)]
        run(
            ' '.join(psql_cmd + create),
            check=True,
            shell=True,
            stdout=DEVNULL,
            stderr=PIPE)
    except CalledProcessError as exc:
        print(exc.stderr)
        raise exc


def load_shp(shapefile, tablename, srid):
    """Load a shapefile into your db

    Parameters
    ----------
    shapefile : Path
    tablename : str
    srid : int
    """
    create_schema_if_not_exists("import")
    table = 'import.{}'.format(tablename.replace('-', '_'))
    try:
        drop = ["-c 'drop table if exists {} cascade'".format(table)]
        run(
            ' '.join(psql_cmd + drop),
            check=True,
            shell=True,
            stdout=DEVNULL,
            stderr=PIPE)
    except CalledProcessError as exc:
        print(exc.stderr)
        raise exc

    # projection system
    shp2pgsql_cmd.append("-s {srid}".format(srid=srid))
    try:
        run(
            ' '.join(shp2pgsql_cmd + [str(shapefile.resolve()), table, '|'] + psql_cmd),
            check=True,
            shell=True,
            stdout=PIPE,
            stderr=PIPE)
    except CalledProcessError as exc:
        print(exc.stderr)
        raise exc
    except Exception as exc:
        print(exc.stderr)
        raise exc
    print('* file {shapefile.name} loaded into the table {table}'.format(**locals()))


def srid_by_shapefile(shapefiles):
    """Find the SRID (projection system) for each shapefile from the dataversion.ini

    See the [srid] section in the file `dataversion.ini`

    Parameters
    ----------
    shapefiles : dict
    """
    config = configparser.ConfigParser()
    config.read(str(_here / 'dataversion.ini'))
    result = {}
    for tablename in shapefiles:
        srid = config["srid"].get(tablename)
        if not srid:
            print("WARN: Table '{tablename}' is not in the [srid] section. See dataversion.ini".format(**locals()))
            print("WARN: You cannot load '{shapefiles[tablename]}'".format(**locals()))
            sys.exit(1)
        result[tablename] = int(srid)
    return result


def data_files(directory, ext):
    """Get the list of files to load into your db

    Parameters
    ----------
    directory : str
        data folder
    ext : str
        file extension

    Returns
    -------
    dict
        dict with 'csv' and 'shp'.
        For each file, you have the name of the table and the filepath
        files = {
           'shp': {'commune': '/home/.../commune-2018-03-21.shp', ...},
           'csv': {}
        }
    """
    config = configparser.ConfigParser()
    config.read(str(_here / 'dataversion.ini'))
    files = {}
    notfound = []
    found = []
    for key, value in config[ext].items():
        # check if file exists
        p = Path(directory) / '{value}.{ext}'.format(**locals())
        if not p.exists():
            notfound.append(p)
            continue
        files[key] = p

    if notfound:
        print('Stopping. Following files not found: {notfound}'.format(**locals()))
        sys.exit(1)

    return files


def retrieve_census(tablename):
    """Get the census from the name of the table

    Suppose that the census is a tablename suffix
    """
    return tablename.split("_")[-1]


def resolve_insee_sqlfile(tablename):
    """Retrieve the name of the SQL file according to the name of the table
    """
    name = "_".join(tablename.split("_")[:-1])
    return "create_infra_" + name + ".sql"


def _load_insee(datapath):
    print("# CSV files loading...")
    csv_files = data_files(datapath, 'csv')
    for tablename, path in sorted(csv_files.items()):
        load_insee_csv(path, tablename)


def _load_ign(datapath):
    print("# SHP files loading...")
    shp_files = data_files(datapath, 'shp')
    srid = srid_by_shapefile(shp_files)
    for tablename, path in sorted(shp_files.items()):
        load_shp(path, tablename, srid[tablename])


def insee_consolidation():
    print("# consolidate Insee tables")
    config = configparser.ConfigParser()
    config.read(str(_here / 'dataversion.ini'))
    census = config["main"].get("census")
    if not census:
        print("Need a census")
        sys.exit(1)
    print("* create tables for the census {census}".format(**locals()))
    sqlfile = _here / 'sql' / "consolidate_infra_insee.sql"
    if not sqlfile.exists():
        print('WARN: sql file not found')
        return

    # you replace some content in the sql file
    #  - census
    sqlcontent = sqlfile.open().read().format(census=census)

    try:
        run(
            ' '.join(psql_cmd),
            input=bytearray(sqlcontent, 'UTF-8'),
            check=True,
            shell=True,
            stdout=DEVNULL,
            stderr=PIPE)
    except CalledProcessError as exc:
        print('ERROR on', sqlfile, exc.stderr)
        raise exc
    print('* SQL file {sqlfile.name} loaded'.format(**locals()))


def contour_iris_ign_consolidation():
    print("# consolidate IRIS contours")
    print("* create the table geoiris".format(**locals()))
    sqlfile = _here / 'sql' / "create_geoiris.sql"
    if not sqlfile.exists():
        print('WARN: sql file not found')
        return

    sqlcontent = sqlfile.open().read()
    try:
        run(
            ' '.join(psql_cmd),
            input=bytearray(sqlcontent, 'UTF-8'),
            check=True,
            shell=True,
            stdout=DEVNULL,
            stderr=PIPE)
    except CalledProcessError as exc:
        print('ERROR on', sqlfile, exc.stderr)
        raise exc
    print('* file {sqlfile.name} loaded'.format(**locals()))


def main():
    parser = argparse.ArgumentParser(description="""
        csv/shp data loader.
        See the dataversion.ini for the table <-> file matching.
        All raw data will be imported in the schema 'import'.
    """)
    parser.add_argument("--ign", action="store_true", help="load IGN data only")
    parser.add_argument("--insee", action="store_true", help="load Insee data only")
    parser.add_argument('PATH', nargs=1, help='path to the data to load')
    args = parser.parse_args()

    if args.insee:
        _load_insee(args.PATH[0])
        insee_consolidation()

    elif args.ign:
        _load_ign(args.PATH[0])
        contour_iris_ign_consolidation()
    else:
        _load_insee(args.PATH[0])
        insee_consolidation()
        _load_ign(args.PATH[0])
        contour_iris_ign_consolidation()


if __name__ == '__main__':
    main()
