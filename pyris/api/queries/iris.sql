-- Retrieve IRIS code (four digits)

SELECT DISTINCT
  iris
  ,nom_com
  ,insee_com
  ,nom_iris
  ,type_iris
  ,st_asGeoJSON(geom) as geom
FROM geoiris
WHERE iris = %s;
