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
    __name__,
    url_prefix='/pyris'
)

@service.route('/')
def index():
    return render_template("index.html")


api = Api(service,
          title='INSEE/IRIS Geolocalizer',
          ui=False,
          version='0.1',
          description="Retrieve some data related to the IRIS codes. Look for an IRIS from an address.")
apidoc.apidoc.static_url_path = service.url_prefix + apidoc.apidoc.static_url_path

iris_code_parser = api.parser()
iris_code_parser.add_argument("limit", required=False, default=10, dest='limit',
                              location='args', help='Limit')

address_parser = api.parser()
address_parser.add_argument("q", required=True, dest='q', location='args',
                            help='Query')

IRIS_MODEL = OrderedDict([('iris', fields.String),
                          ('city', fields.String),
                          ('citycode', fields.String),
                          ('name', fields.String),
                          ('complete_code', fields.String),
                          ('type', fields.String)])
ADDRESS_MODEL = IRIS_MODEL.copy()
ADDRESS_MODEL["address"] = fields.String
ADDRESS_MODEL["lon"] = fields.Float
ADDRESS_MODEL["lat"] = fields.Float

iris_fields = api.model('Iris', IRIS_MODEL)
address_fields = api.model('Address', ADDRESS_MODEL)


@service.route('/doc/')
def swagger_ui():
    return apidoc.ui_for(api)


@api.route("/iris/<string:code>")
class IrisCode(Resource):
    @api.doc(parser=iris_code_parser,
             description="get data for a specific IRIS (four digits)")
    @api.marshal_with(iris_fields, envelope='iris')
    def get(self, code):
        args = iris_code_parser.parse_args()
        limit = args['limit']
        Logger.info("look for IRIS '%s'", code)
        Logger.info("with limit %s", limit)
        iris = extract.get_iris_field(code, limit)
        if not iris:
            api.abort(404, "IRIS code '{}' not found".format(code))
        return iris


@api.route("/compiris/<string:code>")
class CompleteIrisCode(Resource):
    @api.doc(description=("Get data for a specific complete IRIS code (9 digits)."
                          " INSEE City code + IRIS code"))
    @api.marshal_with(iris_fields, envelope='iris')
    def get(self, code):
        Logger.info("look for IRIS '%s'", code)
        iris = extract.get_complete_iris(code)
        if not iris:
            api.abort(404, "Complete IRIS code '{}' not found".format(code))
        return iris


@api.route("/search/")
class IrisFromAddress(Resource):
    @api.doc(parser=address_parser,
             description="Look for an IRIS for a specific address.")
    @api.marshal_with(address_fields, envelope='address')
    def get(self):
        args = address_parser.parse_args()
        query = args['q']
        Logger.info("Look for IRIS for address '%s'", address)
        coord = address.coordinate(query)
        Logger.info("Get coordinate (%s, %s)", coord["lon"], coord["lat"])
        Logger.info("For address '%s'", coord["address"])
        if coord['address'] is None:
            return []
        res = extract.iris_from_coordinate(coord['lon'], coord['lat'])
        res.update(coord)
        return res
