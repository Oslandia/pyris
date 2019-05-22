-- Get all the IRIS in a city by its code

SELECT code_iris
FROM geoiris
WHERE insee_com = %s
