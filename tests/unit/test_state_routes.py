from app.state_routes import normalize_timezone


def test_normalize_timezone_valid_inputs():
    assert normalize_timezone("est") == "EST"
    assert normalize_timezone("Eastern Standard Time") == "EST"
    assert normalize_timezone("cDt") == "CST"
    assert normalize_timezone("mountain daylight time") == "MST"
    assert normalize_timezone("Pacific") == "PST"


def test_normalize_timezone_invalid():
    assert normalize_timezone("utc") is None
    assert normalize_timezone("not-a-timezone") is None
