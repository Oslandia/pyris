#!/bin/bash

# You need to install PostGIS
# Suppose the database 'pyris' exists

# In your database, first do
# > create extension postgis;
# with the superuser role

user="$USERNAME"

shp2pgsql -D -W latin1 -I -s 4326 iris-2013-01-01.shp geoiris | psql -d pyris -U $user

# don't know why but there are several duplications in the shapefile (same geometries for the same IRIS)
psql pyris -c "DELETE FROM geoiris WHERE gid IN (SELECT gid FROM (SELECT gid,RANK() OVER (PARTITION BY dcomiris ORDER BY gid) FROM geoiris) AS X WHERE X.rank > 1);
"
