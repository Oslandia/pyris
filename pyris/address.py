# coding: utf-8

"""French address geolocalizer API
"""

from requests.exceptions import ConnectionError

import slumber
from pyris.config import GEOCODER_URL as URL

URL_CALLBACK = "http://api-adresse.data.gouv.fr"

api = slumber.API(URL)
api_callback = slumber.API(URL_CALLBACK)


def _search(q, postcode, citycode, lat, lon, limit):
    """Allow to callback to the national geocoder service if the local one fails
    """
    try:
        resp = api.search.get(q=q, postcode=postcode, citycode=citycode, lat=lat,
                              lon=lon, limit=limit)
        if not resp["features"]:
            resp = api_callback.search.get(q=q, postcode=postcode, citycode=citycode,
                                           lat=lat, lon=lon, limit=limit)
    except ConnectionError:
        resp = api_callback.search.get(q=q, postcode=postcode, citycode=citycode,
                                       lat=lat, lon=lon, limit=limit)
    return resp


def coordinate(q, postcode, citycode, lat, lon, limit):
    """Get lon/lat coordinate from an address

    q: str
    postcode: str
    citycode: str

    Return (longitude, latitde)
    """
    resources = _search(q=q, postcode=postcode, citycode=citycode, lat=lat, lon=lon, limit=limit)
    if len(resources['features']) == 0:
        return {"lon": None,
                "lat": None,
                'address': None}
    lon, lat = lonlat(resources["features"][0])
    return {"lon": lon,
            "lat": lat,
            "address": retrieve_address(resources["features"][0])}


def retrieve_address(feature):
    """Retrieve the address from a feature
    """
    return feature["properties"]["label"]


def lonlat(feature):
    """Longitude and latitude from a GeoJSON feature
    """
    return feature["geometry"]["coordinates"]


if __name__ == '__main__':
    q = "place des quinconces bordeaux"
    res = coordinate(q)
