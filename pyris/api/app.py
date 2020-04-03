# -*- coding: utf-8 -*-

import logging

import flask
from flask import Blueprint, render_template
from flask_restplus import Api, Resource, apidoc, inputs
from pyris import address
from pyris.api import extract
from pyris.api.insee import api as insee_api

Logger = logging.getLogger(__name__)

service = Blueprint(
    'api',
    __name__)


@service.route('/')
def index():
    return render_template("index.html")

@service.route('/map')
def map():
    return render_template("map.html")

@service.route('/iris/<code>')
def iris(code):
    data = extract.get_complete_iris(code)
    if not data:
        return 404, "IRIS code '{}' not found".format(code)
    print(data)
    return render_template("iris.html",
                           iris=data['complete_code'],
                           name=data['name'],
                           citycode=data['citycode'],
                           city=data['city'],
                           iris_type=data['type'])


api = Api(service,
          title='INSEE/IRIS Geolocalizer',
          ui=False,
          prefix='/api',
          version='0.1',
          description="Retrieve some data related to the IRIS codes. Look for an IRIS from an address.")
api.add_namespace(insee_api)

geojson_parser = api.parser()
geojson_parser.add_argument("geojson", type=inputs.boolean, default=False, location='args',
                            help='GeoJSON')

iris_code_parser = geojson_parser.copy()
iris_code_parser.add_argument("limit", required=False, default=10, dest='limit',
                              location='args', help='Limit')

address_parser = geojson_parser.copy()
address_parser.add_argument("q", required=True, dest='q', location='args',
                            help='Query')
address_parser.add_argument("postcode", required=False, dest='postcode', location='args',
                            help='postcode (code Postal)')
address_parser.add_argument("citycode", required=False, dest='citycode', location='args',
                            help='citycode (code INSEE)')
address_parser.add_argument("lat", required=False, type=float, dest='lat', location='args',
                            help='latitude')
address_parser.add_argument("lon", required=False, type=float, dest='lon', location='args',
                            help='longitude')
address_parser.add_argument("limit", required=False, type=int, dest='limit', location='args',
                            help='limite (nombre d’élements retournés)')


coords_parser = geojson_parser.copy()
coords_parser.add_argument("lat", required=True, type=float, dest='lat', location='args',
                            help='Latitude')
coords_parser.add_argument("lon", required=True, type=float, dest='lon', location='args',
                            help='Longitude')


@service.route('/doc/')
def swagger_ui():
    return apidoc.ui_for(api)


@api.route("/iris/<string:code>")
class IrisCode(Resource):
    @api.doc(parser=iris_code_parser,
             description="get data for a specific IRIS (four digits)")
    def get(self, code):
        args = iris_code_parser.parse_args()
        limit = args['limit']
        Logger.info("look for IRIS '%s'", code)
        Logger.info("with limit %s", limit)
        iris = extract.get_iris_field(code, limit, args['geojson'])
        if not iris:
            api.abort(404, "IRIS code '{}' not found".format(code))
        return iris


@api.route('/city/code/<string:code>')
class IrisListFromCityCode(Resource):
    @api.doc(parser=api.parser(),
             description="Look for all the iris codes in the city matching a city code")
    def get(self, code):
        Logger.info("looking for IRIS in the city %s", code)
        iris=extract.get_iris_list_by_city_code(code)
        if not iris:
            api.abort(404, "City code '{}' not found".format(code))
        return iris


@api.route("/city/search/")
class IrisListFromQuery(Resource):
    @api.doc(parser=address_parser,
             description="Get the list of all the iris codes in the city matching the query")
    def get(self):
        args = address_parser.parse_args()
        q, postcode, citycode, lat, lon, limit = args['q'], args['postcode'], args['citycode'], args['lat'], args['lon'], args['limit']
        Logger.info("Look for a list of IRIS in a city for q '%s', postcode '%s', citycode '%s', lat '%s' , lon '%s', limit '%s'",
                    q, postcode, citycode, lat, lon, limit)
        coord = address.coordinate(q, postcode, citycode, lat, lon, limit)
        if coord["address"] is None:
            # Requests sent to '/api/search' that match nothing do not return a 404 error like other requests.
            # Is this an intentional choice?
            api.abort(404, "No city found matching that query")
        # I'm pretty sure the preferred order is usually latitude first, then longitude
        Logger.info("Looking for iris at coordinates %s, %s", coord["lat"], ["lon"])
        iris = extract.iris_from_coordinate(coord["lon"], coord["lat"])
        iris_list = extract.get_iris_list_by_city_code(iris["citycode"])
        return {"city_name": iris["city"], "city_code": iris["citycode"], "iris_list": iris_list}


@api.route("/coords")
class IrisFromCoordinates(Resource):
    @api.doc(parser=coords_parser,
             description="get IRIS from a lat/lon coordinates")
    def get(self):
        args = coords_parser.parse_args()
        lat, lon = args['lat'], args['lon']
        Logger.info("Coordinates '%s'", (lon, lat))
        Logger.info("geojson? %s", args['geojson'])
        res = extract.iris_from_coordinate(lon, lat, args['geojson'])
        if not res:
            api.abort(404, "IRIS not found from coordinates ({}, {})".format(lat, lon))
        return res


@api.route("/compiris/<string:code>")
class CompleteIrisCode(Resource):
    @api.doc(parser=geojson_parser,
             description=("Get data for a specific complete IRIS code (9 digits)."
                          " INSEE City code + IRIS code"))
    def get(self, code):
        Logger.info("look for IRIS '%s'", code)
        args = geojson_parser.parse_args()
        iris = extract.get_complete_iris(code, args['geojson'])
        if not iris:
            api.abort(404, "Complete IRIS code '{}' not found".format(code))
        return iris


@api.route("/search/")
class IrisFromAddress(Resource):
    @api.doc(parser=address_parser,
             description="Look for an IRIS for a specific address. This will use the `search` endpoint of API Adresse of geo.api.gouv.fr service (see documentation here geo.api.gouv.fr/adresse) to retrieve coordinates and then will retrieve iris code from those coordinates")
    def get(self):
        args = address_parser.parse_args()
        q, postcode, citycode, lat, lon, limit = args['q'], args['postcode'], args['citycode'], args['lat'], args['lon'], args['limit']
        Logger.info("Look for IRIS for q '%s', postcode '%s', citycode '%s', lat '%s' , lon '%s', limit '%s'", q, postcode, citycode, lat, lon, limit)
        coord = address.coordinate(q, postcode, citycode, lat, lon, limit)
        Logger.info("Get coordinate (%s, %s)", coord["lon"], coord["lat"])
        Logger.info("For address '%s'", coord["address"])
        if coord['address'] is None:
            return []
        res = extract.iris_from_coordinate(coord['lon'], coord['lat'], args['geojson'])
        res.update(coord)
        return res
