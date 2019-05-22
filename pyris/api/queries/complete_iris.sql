-- Retrieve complete IRIS code (nine digits)

SELECT DISTINCT
  iris
  ,nom_com
  ,insee_com
  ,nom_iris
  ,code_iris
  ,type_iris
  ,st_asGeoJSON(geom) as geom
FROM geoiris
WHERE code_iris = %s;
