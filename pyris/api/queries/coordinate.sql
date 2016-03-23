-- Query an entity from its lon,lat coordinate

SELECT
   iris
  ,nom_com
  ,depcom
  ,nom_iris
  ,dcomiris
  ,typ_iris
FROM geoiris
WHERE geom && st_makepoint(%s, %s)
LIMIT 1;
