# -*- coding: utf-8 -*-

from __future__ import absolute_import, division, print_function, unicode_literals
import logging
from collections import OrderedDict

from flask import Blueprint, jsonify, render_template
from flask_restplus import fields
from flask.ext.restplus import Resource, Api, apidoc

from pyris import address
from pyris.api import extract


Logger = logging.getLogger(__name__)

service = Blueprint(
    'api',
    __name__)


@service.route('/')
def index():
    return render_template("index.html")


api = Api(service,
          title='INSEE/IRIS Geolocalizer',
          ui=False,
          version='0.1',
          description="Retrieve some data related to the IRIS codes. Look for an IRIS from an address.")


geojson_parser = api.parser()
geojson_parser.add_argument("geojson", type=bool, default=False, location='args',
                            help='GeoJSON')

iris_code_parser = geojson_parser.copy()
iris_code_parser.add_argument("limit", required=False, default=10, dest='limit',
                              location='args', help='Limit')

address_parser = geojson_parser.copy()
address_parser.add_argument("q", required=True, dest='q', location='args',
                            help='Query')

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
             description="Look for an IRIS for a specific address.")
    def get(self):
        args = address_parser.parse_args()
        query = args['q']
        Logger.info("Look for IRIS for address '%s'", address)
        coord = address.coordinate(query)
        Logger.info("Get coordinate (%s, %s)", coord["lon"], coord["lat"])
        Logger.info("For address '%s'", coord["address"])
        if coord['address'] is None:
            return []
        res = extract.iris_from_coordinate(coord['lon'], coord['lat'], args['geojson'])
        res.update(coord)
        return res
