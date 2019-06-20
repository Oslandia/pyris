# coding: utf-8

"""French address geolocalizer API
"""

import slumber

from pyris.conf import GEOCODER_URL as URL

api = slumber.API(URL)


def coordinate(q, postcode, citycode, lat, lon, limit):
    """Get lon/lat coordinate from an address

    q: str
    postcode: str
    citycode: str    
    
    Return (longitude, latitde)
    """
    resources = api.search.get(q=q, postcode=postcode, citycode=citycode, lat=lat, lon=lon, limit=limit)
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
