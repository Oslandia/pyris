-- Get all the IRIS in a city by its code

SELECT dcomiris
FROM geoiris
WHERE depcom = %s
