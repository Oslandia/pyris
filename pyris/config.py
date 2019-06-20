# coding: utf-8

"""Pyris configuration

Retrieve user and password from the YAML configuration file for the database
access
"""

import os
import io

import yaml
from yaml import load as yload


_cfgfile = os.environ.get('PYRIS_APP_SETTINGS')

if _cfgfile is not None:
    with open(_cfgfile, 'r') as fobj:
        conf = yload(fobj.read(), yaml.Loader)
        DATABASE = conf.get('database', {})
        geocoder_conf = conf.get("geocoder")
        if geocoder_conf:
            GEOCODER_URL = geocoder_conf["url"]
        else:
            GEOCODER_URL = "http://api-adresse.data.gouv.fr"
else:
    DATABASE = {"USER": os.environ["USER"],
                "HOST": "localhost"}
    GEOCODER_URL = "http://api-adresse.data.gouv.fr"
