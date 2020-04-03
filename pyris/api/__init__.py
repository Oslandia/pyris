# -*- coding: utf-8 -*-

import io
import logging
import os
from datetime import date, datetime

from yaml import load as yload

import flask
from flask import Flask
from flask.json import JSONEncoder
from flask_restplus import Api as rpapi
from pyris.api.app import service

# app version
__version__ = '1.0'

ISO_FORMAT = "%Y-%m-%d"
Logger = logging.getLogger(__name__)

LOG_LEVELS = {
    'debug': logging.DEBUG,
    'info': logging.INFO,
    'warning': logging.WARNING,
    'error': logging.ERROR,
    'critical': logging.CRITICAL
}

console = logging.StreamHandler()
log_formatter = logging.Formatter("%(asctime)s :: %(levelname)s :: %(module)s :: %(funcName)s :: %(message)s")
console.setFormatter(log_formatter)
Logger.addHandler(console)


class CustomJSONEncoder(JSONEncoder):
    def default(self, obj):
        if isinstance(obj, (date, datetime)):
            return obj.strftime(ISO_FORMAT)
        return JSONEncoder.default(self, obj)


def set_level(level='info'):
    """
    Set log level
    """
    Logger.setLevel(LOG_LEVELS.get(level))


def register_extensions(app):
    """
    Register extensions into flask application
    """
    app.register_blueprint(service)


def load_yaml_config(filename):
    """
    Open Yaml file, load content for flask config and returns it as a python dict
    """
    content = io.open(filename, 'r').read()
    return yload(content).get('flask', {})


@property
def specs_url(self):
    """Fixes issue where swagger-ui makes a call to swagger.json over HTTP.
       This can ONLY be used on servers that actually use HTTPS.  On servers that use HTTP,
       this code should not be used at all.
    """
    return flask.url_for(self.endpoint('specs'), _external=True, _scheme='https')


def create_app(env='Defaults'):
    """
    Creates application.
    :returns: flask application instance
    """
    app = Flask(__name__)
    cfgfile = os.environ.get('PYRIS_APP_SETTINGS')
    Logger.info(cfgfile)
    if cfgfile:
        app.config.update(load_yaml_config(cfgfile))

    if 'LOG_LEVEL' not in app.config:
        set_level('debug')
    else:
        set_level(app.config['LOG_LEVEL'])
    if app.config['FORCE_SWAGGER_JSON_HTTPS']:
        rpapi.specs_url = specs_url
    Logger.info("Run the app")
    register_extensions(app)
    app.json_encoder = CustomJSONEncoder
    app.config.SWAGGER_UI_DOC_EXPANSION = 'list'

    return app
