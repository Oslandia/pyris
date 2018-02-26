#!/bin/bash

set -e
set -u

# INSEE infracommunal (IRIS) data to db
# suppose 'pyris' db exist
DBNAME=pyris

# here
_here="$( cd "$(dirname "$0")" ; pwd -P )"

# create schema
psql $DBNAME -c 'CREATE SCHEMA IF NOT EXISTS insee;'

# create all tables
psql $DBNAME -f sql/create_infra_activites.sql
psql $DBNAME -f sql/create_infra_couples_familles_menages.sql
psql $DBNAME -f sql/create_infra_diplomes_formation.sql
psql $DBNAME -f sql/create_infra_logement.sql
psql $DBNAME -f sql/create_infra_population.sql

# use in2csv command / in csvkit - https://csvkit.readthedocs.io/
ARGS="-e LATIN1 --sheet IRIS -K 5"
ls *.xls | parallel "in2csv $ARGS {} > {}.csv"

# if you don't have the 'parallel' GNU command - https://www.gnu.org/software/bash/manual/html_node/GNU-Parallel.html
# in2csv $ARGS base-ic-activite-residents-2013.xls > base-ic-activite-residents-2013.xls.csv
# in2csv $ARGS base-ic-couples-familles-menages-2013.xls > base-ic-couples-familles-menages-2013.xls.csv
# in2csv $ARGS base-ic-diplomes-formation-2013.xls > base-ic-diplomes-formation-2013.xls.csv
# in2csv $ARGS base-ic-evol-struct-pop-2013.xls > base-ic-evol-struct-pop-2013.xls.csv
# in2csv $ARGS base-ic-logement-2013.xls > base-ic-logement-2013.xls.csv

# copy CSV data into the db
psql $DBNAME -c "COPY insee.activite FROM '$_here/base-ic-activite-residents-2013.xls.csv' WITH (FORMAT CSV, HEADER TRUE);"

psql $DBNAME -c "COPY insee.formation FROM '$_here/base-ic-diplomes-formation-2013.xls.csv' WITH (FORMAT CSV, HEADER TRUE);"

psql $DBNAME -c "COPY insee.logement FROM '$_here/base-ic-logement-2013.xls.csv' WITH (FORMAT CSV, HEADER TRUE);"

psql $DBNAME -c "COPY insee.menage FROM '$_here/base-ic-couples-familles-menages-2013.xls.csv' WITH (FORMAT CSV, HEADER TRUE);"

psql $DBNAME -c "COPY insee.population FROM '$_here/base-ic-evol-struct-pop-2013.xls.csv' WITH (FORMAT CSV, HEADER TRUE);"
