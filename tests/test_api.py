import pytest

from pyris.api import create_app

app = create_app()


@pytest.fixture
def client():
    client = app.test_client()
    return client


def test_app_index(client):
    resp = client.get('/')
    assert resp.status_code == 200


def test_api_iris_from_city(client):
    lyon_premier_arr_code = "69381"
    resp = client.get("/api/city/code/" + lyon_premier_arr_code)
    assert resp.status_code == 200
    assert len(resp.json) > 5


def test_api_iris(client):
    code_iris = '693810101'
    resp = client.get("/api/compiris/" + code_iris)
    assert resp.status_code == 200
    data = resp.json
    assert data["type"] == "H"
    assert data["citycode"] == "69381"


def test_api_coords(client):
    lon, lat = 4.836098, 45.765926
    resp = client.get("/api/coords", query_string={"lat": lat, "lon": lon})
    assert resp.status_code == 200
    data = resp.json
    assert data["complete_code"] == "693810101"


def test_api_address_search(client):
    """note: this route depends on a remote service dedicated to address searching
    """
    query = "11 rue république Lyon"
    resp = client.get("/api/search/", query_string={"q": query})
    assert resp.status_code == 200
    data = resp.json
    assert data["complete_code"] == "693810101"


def test_api_city_search(client):
    query = "bordeaux"
    resp = client.get("/api/city/search/" + query)
    assert resp.status_code == 200
    data = resp.json
    assert data["city_name"] == "Bordeaux"
    assert len(data["iris_list"]) > 33


def test_api_insee_population(client):
    code_iris = '693810101'
    resp = client.get("/api/insee/population/" + code_iris)
    assert resp.status_code == 200
    data = resp.json
    assert data["iris"] == code_iris
    assert data["citycode"] == "69381"
    assert "population" in data


def test_api_insee_population_distribution(client):
    code_iris = '693810101'
    # by age
    resp = client.get("/api/insee/population/distribution/" + code_iris,
                      query_string={"by": "age"})
    assert resp.status_code == 200
    data = resp.json
    assert data["iris"] == code_iris
    assert data["citycode"] == "69381"
    assert "population_15_29" in data["data"]

    # by sex
    resp = client.get("/api/insee/population/distribution/" + code_iris,
                      query_string={"by": "sex"})
    assert resp.status_code == 200
    data = resp.json
    assert data["iris"] == code_iris
    assert data["citycode"] == "69381"
    assert "female_15_29" in data["data"]


def test_api_insee_logement(client):
    code_iris = '693810101'
    resp = client.get("/api/insee/logement/" + code_iris)
    assert resp.status_code == 200
    data = resp.json
    assert data["iris"] == code_iris
    assert data["citycode"] == "69381"
    assert "logement" in data


def test_api_insee_logement_distribution(client):
    code_iris = '693810101'

    # by room
    resp = client.get("/api/insee/logement/distribution/" + code_iris,
                      query_string={"by": "room"}
    )
    assert resp.status_code == 200
    data = resp.json
    assert data["iris"] == code_iris
    assert data["citycode"] == "69381"
    assert "main_residence_2_room" in data["data"]


def test_api_insee_activite(client):
    code_iris = '693810101'
    resp = client.get("/api/insee/activite/" + code_iris)
    assert resp.status_code == 200
    data = resp.json
    assert data["iris"] == code_iris
    assert data["citycode"] == "69381"
    assert "actif" in data
    assert "chomeur" in data


def test_api_insee_activite_distribution(client):
    code_iris = '693810101'
    # by age
    resp = client.get("/api/insee/activite/distribution/" + code_iris,
                      query_string={"by": "age"})
    assert resp.status_code == 200
    data = resp.json
    assert data["iris"] == code_iris
    assert data["citycode"] == "69381"
    assert "actif_25_54" in data["data"]

    # by sex
    resp = client.get("/api/insee/activite/distribution/" + code_iris,
                      query_string={"by": "sex"})
    assert resp.status_code == 200
    data = resp.json
    assert data["iris"] == code_iris
    assert data["citycode"] == "69381"
    assert "femme_actif" in data["data"]
