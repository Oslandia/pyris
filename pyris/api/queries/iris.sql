-- Retrieve IRIS code (four digits)

SELECT DISTINCT
   depcom
  ,iris
  ,nom_com
  ,nom_iris
  ,dcomiris
  ,typ_iris
  ,st_asGeoJSON(geom) as geom
FROM geoiris
WHERE iris = %s;
