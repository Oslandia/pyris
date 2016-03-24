-- Retrieve complete IRIS code (nine digits)

SELECT DISTINCT
   depcom
  ,iris
  ,nom_com
  ,nom_iris
  ,dcomiris
  ,typ_iris
FROM geoiris
WHERE dcomiris = %s;
