# Pyris

IRIS INSEE geolocalization

Pyris try to collect data about IRIS from the French INSEE institute


## Data

IRIS shapes at https://www.data.gouv.fr/fr/datasets/contour-des-iris-insee-tout-en-un/

Get and insert data with:

* `data/download_data.sh`
* `data/insert_data.sh`

Data will be stored in a PostgreSQL database with the PostGIS extension. The
name of database is `pyris` but you can change it in the `insert_data.sh`.

You need to install PostgreSQL, PostGIS. For Debian:

    sudo apt-get install postgresql postgis

Test the insertion with a simple:

```sql
SELECT  gid,depcom,nom_com,iris,typ_iris
FROM geoiris LIMIT 10;
```

## REST API

You can:

* `URL/iris/2386` to the some information about a specific IRIS code

* `URL/search/lon=-0.58961&lat=43.26079` to get the IRIS code and related content from a coordinate

## Launch the Web App

Specify the path to the YAML configuration file. Don't forget to set the
user/password for the database access.

`export PYRIS_APP_SETTINGS=/path/to/app.yml`

See an [example of a app.yml file](https://github.com/garaud/pyris/blob/master/app.yml)

## Requirements

* postgresql
* postgis
* flask
* flask restplus
* pyaml
