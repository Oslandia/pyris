#!/bin/bash

# You need to have a CREATEDB and SUPERUSER roles.
# If it's not the case
#   > ALTER ROLE <your_username> CREATEDB SUPERUSER;
# in a psql shell as a 'postgres' user.
createdb pyris
psql pyris -c "CREATE EXTENSION postgis;"
