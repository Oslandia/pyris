from flask_restplus import Namespace, Resource, fields

from pyris.api import extract


api = Namespace('insee', description='Some stats from INSEE for each IRIS')


@api.route('/')
class InseeData(Resource):
    @api.doc('INSEE data list')
    def get(self):
        return ['population', 'activite', 'logement',
                'menage', 'formation']


@api.route('/population/<string:code>')
class IrisCode(Resource):
    @api.doc("get population for an IRIS")
    def get(self, code):
        if len(code) != 9:
            api.abort(400, "IRIS code is malformed (9 digits)")
        rset = extract.get_iris_population(code)
        if not rset:
            api.abort(404, "IRIS code '{}' not found".format(code))
        return rset[0]
