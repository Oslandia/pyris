# -*- coding: utf-8 -*-
from __future__ import absolute_import, division, print_function, unicode_literals

import io
import os
import logging
from datetime import datetime, date

from flask import Flask
from flask.json import JSONEncoder
from yaml import load as yload

from pyris.api.app import service

# app version
__version__ = '0.1.dev0'

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
log_formatter = logging.Formatter("[%(asctime)s][%(levelname)s][%(module)s] %(message)s")
console.setFormatter(log_formatter)
Logger.addHandler(console)
# Log file
log_file = os.path.join(os.environ['HOME'], 'pyris-flaskapp.log')
fileHandler = logging.FileHandler(log_file)
fileHandler.setFormatter(log_formatter)
Logger.addHandler(fileHandler)


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


def create_app(env='Defaults'):
    """
    Creates application.
    :returns: flask application instance
    """
    app = Flask(__name__)
    cfgfile = os.environ.get('PYRIS_APP_SETTINGS')
    print(cfgfile)
    Logger.info(cfgfile)
    if cfgfile:
        app.config.update(load_yaml_config(cfgfile))

    set_level(app.config['LOG_LEVEL'])
    Logger.info("Run the app")
    register_extensions(app)
    app.json_encoder = CustomJSONEncoder
    app.config.SWAGGER_UI_DOC_EXPANSION = 'list'

    return app
