-- Retrieve IRIS code (four digits)

SELECT DISTINCT
  iris
  ,nom_com
  ,depcom
  ,nom_iris
  ,dcomiris
  ,typ_iris
  ,st_asGeoJSON(geom) as geom
FROM geoiris
WHERE iris = %s;
