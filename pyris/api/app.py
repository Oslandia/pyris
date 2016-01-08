# -*- coding: utf-8 -*-

from __future__ import absolute_import, division, print_function, unicode_literals
import logging
from collections import OrderedDict

from flask import Blueprint, jsonify, render_template
from flask_restplus import fields
from flask.ext.restplus import Resource, Api, apidoc

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
          title='IRIS Geolocalization',
          ui=False,
          version='1.0',
          description="Retrieve IRIS from coordinate (latitude,longitude).")
apidoc.apidoc.static_url_path = service.url_prefix + apidoc.apidoc.static_url_path

coordinate_parser = api.parser()
coordinate_parser.add_argument("lon", required=True, dest='lon', location='args', help='Longitude')
coordinate_parser.add_argument("lat", required=True, dest='lat', location='args', help='Latitude')


iris_fields = api.model('Iris',
                        OrderedDict([('iris', fields.String),
                                     ('city', fields.String),
                                     ('citycode', fields.String),
                                     ('name', fields.String),
                                     ('complete_code', fields.String),
                                     ('type', fields.String)]))

@service.route('/doc/', endpoint='doc')
def swagger_ui():
    return apidoc.ui_for(api)


@api.route("/iris/<string:code>")
class IrisCode(Resource):
    @api.doc(description="get data for a specific IRIS")
    def get(self, code):
        # check the search_id
        iris = extract.get_iris_field(code)
        if not iris:
            api.abort(404, "IRIS code '{}' not found".format(code))
        return iris


@api.route("/search/")
class SearchIris(Resource):
    @api.doc(parser=coordinate_parser,
             description="Look for an IRIS for a coordinate (lon/lat).")
    @api.marshal_with(iris_fields, envelope='iris')
    def get(self):
        args = coordinate_parser.parse_args()
        lon, lat = args['lon'], args['lat']
        Logger.info("Look for IRIS from coordinate lon/lat ('%s', '%s')", lon, lat)
        return extract.iris_from_coordinate(lon, lat)
