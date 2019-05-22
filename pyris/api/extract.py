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
Q_IRIS_BY_CITY_CODE = "iris_by_city_code.sql"
Q_COMPIRIS = "complete_iris.sql"
Q_COORD = "coordinate.sql"
Q_POPULATION = "iris_population.sql"
Q_POPULATION_AGE = "iris_population_age.sql"
Q_POPULATION_SEX = "iris_population_sex.sql"
Q_LOGEMENT = "iris_logement.sql"
Q_LOGEMENT_ROOM = "iris_logement_room.sql"
Q_LOGEMENT_AREA = "iris_logement_area.sql"
Q_LOGEMENT_YEAR = "iris_logement_year.sql"
Q_EMPLOYMENT = "iris_activite.sql"
Q_EMPLOYMENT_SEX = "iris_activite_sex.sql"
Q_EMPLOYMENT_AGE = "iris_activite_age.sql"
Q_EMPLOYMENT_SECTOR = "iris_activite_secteur.sql"

Logger = logging.getLogger(__name__)


def _load_sql_file(fname):
    """Return the content of the SQL file `fname`

    fname: str

    Return a string
    """
    skip = lambda x: x.strip().startswith('--') or len(x.strip()) == 0
    with open(os.path.join(_QUERY_DIR, fname)) as fobj:
        return "".join(line for line in fobj if not skip(line))


def _query(q, params=None, columns=False):
    """Carry out a SQL query

    Only fetch one result
    """
    Logger.debug("processing query '%s'", q)
    with psycopg2.connect(database=DATABASE["DBNAME"],
                          user=DATABASE['USER'],
                          password=DATABASE.get('PASSWORD'),
                          host=DATABASE['HOST']) as cnx:
        with cnx.cursor() as cu:
            if params is not None:
                cu.execute(q, params)
            else:
                cu.execute(q)
            rset = cu.fetchall()
            if rset and columns:
                names = [x.name for x in cu.description]
                return [{x: v for x, v in zip(names, values)}
                        for values in rset]
            return rset


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


def _split_data(data):
    """Split the keys of the data between 'properties' and 'data'

    data: list (or None)
        Result of a SQL query

    Returns
    -------
    dict
    """
    if data is None:
        return data
    data = data[0]
    properties = ["iris", "city", "citycode", "label"]
    result = {k: data.pop(k) for k in properties}
    result['data'] = data
    return result


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


def get_iris_list_by_city_code(code):
    """Get the list of IRIS in a city by its code
    
    code: str
        City code. Five digits.
    """
    query=_load_sql_file(Q_IRIS_BY_CITY_CODE)
    Logger.debug("Query: %s", query)
    res=_query(query, (code,))
    Logger.debug("res: %s", res)
    return [x[0] for x in res] if res else res


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


def get_iris_population(code):
    """Get the population for a specific IRIS

    Parameters
    ----------
    code : str
        IRIS code (9 digits)

    Returns
    -------
    list of dicts
    """
    query_population = _load_sql_file(Q_POPULATION)
    Logger.debug("Query '%s'", query_population)
    return _query(query_population, (code,), columns=True)


def get_iris_population_age(code):
    """Get the population distribution by age for a specific IRIS

    Parameters
    ----------
    code : str
        IRIS code (9 digits)

    Returns
    -------
    list of dicts
    """
    query_population = _load_sql_file(Q_POPULATION_AGE)
    data = _query(query_population, (code,), columns=True)
    return _split_data(data)


def get_iris_population_sex(code):
    """Get the population distribution by sex and age for a specific IRIS

    Parameters
    ----------
    code : str
        IRIS code (9 digits)

    Returns
    -------
    dict
    """
    query_population = _load_sql_file(Q_POPULATION_SEX)
    data = _query(query_population, (code,), columns=True)
    return _split_data(data)


def get_iris_logement(code, by=None):
    """Get the housing data for a specific IRIS

    Parameters
    ----------
    code : str
        IRIS code (9 digits)
    by : str (optional)
        Get data by room, area or year

    Returns
    -------
    dict
    """
    if by not in (None, 'room', 'area', 'year'):
        raise ValueError("Value {} for the 'by' parameter is not supported".format(by))
    if by is None:
        query = _load_sql_file(Q_LOGEMENT)
        rset = _query(query, (code,), columns=True)
        return rset[0] if rset else rset
    elif by == 'room':
        query = _load_sql_file(Q_LOGEMENT_ROOM)
    elif by == 'area':
        query = _load_sql_file(Q_LOGEMENT_AREA)
    elif by == 'year':
        query = _load_sql_file(Q_LOGEMENT_YEAR)
    data = _query(query, (code,), columns=True)
    return _split_data(data)


def get_iris_employment(code, by=None):
    """Get the employment data for a specific IRIS

    Parameters
    ----------
    code : str
        IRIS code (9 digits)
    by : str (optional)
        Get data by sex, age

    Returns
    -------
    list of dicts
    """
    if by not in (None, 'sex', 'age', 'sector'):
        raise ValueError("Value {} for the 'by' parameter is not supported".format(by))
    if by is None:
        query = _load_sql_file(Q_EMPLOYMENT)
        rset = _query(query, (code,), columns=True)
        return rset[0] if rset else rset
    elif by == 'sex':
        query = _load_sql_file(Q_EMPLOYMENT_SEX)
    elif by == 'age':
        query = _load_sql_file(Q_EMPLOYMENT_AGE)
    elif by == 'sector':
        query = _load_sql_file(Q_EMPLOYMENT_SECTOR)

    data = _query(query, (code,), columns=True)
    return _split_data(data)
