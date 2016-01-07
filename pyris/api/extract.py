# coding: utf-8


import logging

import psycopg2

from pyris.config import user, password
from pyris.api.sqlrequests import (query_iris,
                                   query_coordinate)


Logger = logging.getLogger(__name__)


def _iris_fields(res):
    """Iris field from a SQL query result
    """
    return {"iris": res[0],
            'city': res[1],
            'postcode': res[2],
            'name': res[3],
            'complete_code': res[4],
            'type': res[5]}


def get_iris_field(code):
    """Get some date from the IRIS code
    """

    with psycopg2.connect(database="pyris", user=user, password=password, host='localhost') as cnx:
        with cnx.cursor() as cu:
            cu.execute(query_iris, (code,))
            res = cu.fetchone()
            if res is not None:
                return _iris_fields(res)
            return res


def iris_from_coordinate(lon, lat):
    """Get the IRIS code from a coordinate.
    """
    with psycopg2.connect(database="pyris", user=user, password=password, host='localhost') as cnx:
        with cnx.cursor() as cu:
            cu.execute(query_coordinate, (lon, lat))
            res = cu.fetchone()
            if res is not None:
                return _iris_fields(res)
            return res
