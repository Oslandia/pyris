# coding: utf-8

"""Extract data from the database
"""

from __future__ import absolute_import, division, print_function, unicode_literals

import logging

import psycopg2

from pyris.config import DATABASE
from pyris.api.sqlrequests import (query_iris,
                                   query_coordinate)


Logger = logging.getLogger(__name__)



def _query(q, params=None):
    """Carry out a SQL query

    Only fetch one result
    """
    with psycopg2.connect(database="pyris",
                          user=DATABASE['USER']) as cnx:
        with cnx.cursor() as cu:
            if params is not None:
                cu.execute(q, params)
            else:
                cu.execute(q)
            return cu.fetchone()


def _iris_fields(res):
    """Iris field from a SQL query result
    """
    return {"iris": res[0],
            'city': res[1],
            'citycode': res[2],
            'name': res[3],
            'complete_code': res[4],
            'type': res[5]}


def get_iris_field(code):
    """Get some date from the IRIS code
    """
    res = _query(query_iris, (code,))
    if res is not None:
        return _iris_fields(res)
    return res


def iris_from_coordinate(lon, lat):
    """Get the IRIS code from a coordinate.
    """
    res = _query(query_coordinate, (lon, lat))
    if res is not None:
        return _iris_fields(res)
    return res
