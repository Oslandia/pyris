# Pyris

IRIS INSEE geolocalization

Pyris try to collect data about IRIS


## Data

IRIS shapes at https://www.data.gouv.fr/fr/datasets/contour-des-iris-insee-tout-en-un/

Get and insert data with:

* `data/download_data.sh`
* `data/insert_data.sh`


## REST API

You can:

* `URL/iris/2386` to the some information about a specific IRIS code

* `URL/search/lon=-0.58961&lat=43.26079` to get the IRIS code and related content from a coordinate


## Requirements

* Postgresql
* PostGIS
* Flask
