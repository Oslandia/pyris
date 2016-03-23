# coding: utf-8

"""Store some SQL queries
"""


query_iris = """SELECT DISTINCT
   depcom
  ,iris
  ,nom_com
  ,nom_iris
  ,dcomiris
  ,typ_iris
FROM geoiris
WHERE iris = %s;"""


# coordinate: (lon, lat)
query_coordinate = """SELECT
   iris
  ,nom_com
  ,depcom
  ,nom_iris
  ,dcomiris
  ,typ_iris
FROM geoiris
WHERE geom && st_makepoint(%s, %s)
LIMIT 1;"""
