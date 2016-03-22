# coding: utf-8

"""French address geolocalizer API
"""

import slumber

URL = "http://api-adresse.data.gouv.fr"
api = slumber.API(URL)


def coordinate(address):
    """Get lon/lat coordinate from an address

    address: str

    Return (longitude, latitde)
    """
    resources = api.search.get(q=address)
    if len(resources['features']) == 0:
        return None,None
    return lonlat(resources["features"][0])


def lonlat(feature):
    """Longitude and latitude from a GeoJSON feature
    """
    return feature["geometry"]["coordinates"]


if __name__ == '__main__':
    q = "place des quinconces bordeaux"
    lon,lat = coordinate(q)
