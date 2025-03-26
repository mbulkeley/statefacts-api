import pytest
from app.main import create_app

@pytest.fixture
def client():
    app = create_app(testing=True)
    app.config['DEBUG'] = True
    with app.test_client() as client:
        yield client

def test_get_states(client):
    response = client.get("/states")
    assert response.status_code == 200
    data = response.get_json()
    assert "states" in data
    assert isinstance(data["states"], list)

def test_get_specific_state(client):
    response = client.get("/states/CO")
    assert response.status_code == 200
    data = response.get_json()
    assert data["abbreviation"] == "CO"
    assert "top_cities" in data
