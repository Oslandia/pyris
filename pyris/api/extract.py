"""Extract data from the database
"""

import os
import json
import logging

import psycopg2

from pyris.config import DATABASE


_HERE = os.path.abspath(os.path.dirname(__file__))
_QUERY_DIR = os.path.join(_HERE, "queries")
Q_IRIS = "iris.sql"
Q_COMPIRIS = "complete_iris.sql"
Q_COORD = "coordinate.sql"

Logger = logging.getLogger(__name__)


def _load_sql_file(fname):
    """Return the content of the SQL file `fname`

    fname: str

    Return a string
    """
    skip = lambda x: x.strip().startswith('--') or len(x.strip()) == 0
    with open(os.path.join(_QUERY_DIR, fname)) as fobj:
        return "".join(line for line in fobj if not skip(line))


def _query(q, params=None):
    """Carry out a SQL query

    Only fetch one result
    """
    Logger.debug("processing query '%s'", q)
    with psycopg2.connect(database="pyris",
                          user=DATABASE['USER'],
                          password=DATABASE.get('PASSWORD'),
                          host=DATABASE['HOST']) as cnx:
        with cnx.cursor() as cu:
            if params is not None:
                cu.execute(q, params)
            else:
                cu.execute(q)
            return cu.fetchall()


def _iris_fields(res, geojson=False):
    """Iris field from a SQL query result
    """
    data = {"iris": res[0],
            'city': res[1],
            'citycode': res[2],
            'name': res[3],
            'complete_code': res[4],
            'type': res[5]}
    if geojson:
        return {"type": "Feature",
                "geometry": json.loads(res[6]),
                "properties": data}
    return data


def get_iris_field(code, limit=None, geojson=False):
    """Get some data from the IRIS code

    code: str
        IRIS code. Four digits
    limit: int (None)
        number of results
    """
    query_iris = _load_sql_file(Q_IRIS)
    if limit is not None:
        query_iris = query_iris.replace(";", " LIMIT {};".format(limit))
    res = _query(query_iris, (code,))
    Logger.debug("res: %s", res)
    if res:
        data = [_iris_fields(x, geojson) for x in res]
        if geojson:
            return {"type": "FeatureCollection",
                    "features": data}
        return data
    return res


def get_complete_iris(code, geojson=False):
    """Get some date from the complete IRIS code

    Complete IRIS code is made up of:
        - INSEE City code (5 digits). Different from postal code
        - IRIS code (4 diits)

    code: str
        Complete IRIS code. Nine digits
    """
    query = _load_sql_file(Q_COMPIRIS)
    Logger.debug("Query '%s'", query)
    res = _query(query, (code,))
    Logger.debug("res: %s", res)
    if res:
        return _iris_fields(res[0], geojson)
    return res


def iris_from_coordinate(lon, lat, geojson=False):
    """Get the IRIS code from a coordinate.
    """
    query_coordinate = _load_sql_file(Q_COORD)
    Logger.debug("Query '%s'", query_coordinate)
    res = _query(query_coordinate, (lon, lat))
    Logger.debug("res: %s", res)
    if res:
        return _iris_fields(res[0], geojson)
    return res
