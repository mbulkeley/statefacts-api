from flask import Blueprint, jsonify, request
from app.db import get_connection

state_routes = Blueprint('state_routes', __name__)

def normalize_timezone(input_tz):
    tz_map = {
        "EST": ["EST", "EDT", "EASTERN", "EASTERN STANDARD TIME", "EASTERN DAYLIGHT TIME"],
        "CST": ["CST", "CDT", "CENTRAL", "CENTRAL STANDARD TIME", "CENTRAL DAYLIGHT TIME"],
        "MST": ["MST", "MDT", "MOUNTAIN", "MOUNTAIN STANDARD TIME", "MOUNTAIN DAYLIGHT TIME"],
        "PST": ["PST", "PDT", "PACIFIC", "PACIFIC STANDARD TIME", "PACIFIC DAYLIGHT TIME"]
    }
    input_upper = input_tz.strip().upper()
    for standard, aliases in tz_map.items():
        if input_upper in aliases:
            return standard
    return None

@state_routes.route('/states', methods=['GET'])
def get_states():
    timezone = request.args.get('timezone')
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            if timezone:
                norm_tz = normalize_timezone(timezone)
                if not norm_tz:
                    return jsonify(error="Invalid timezone"), 400
                cur.execute(
                    "SELECT name, abbreviation, capital, timezone FROM states WHERE timezone = %s",
                    (norm_tz,)
                )
            else:
                cur.execute("SELECT name, abbreviation, capital, timezone FROM states ORDER BY name")
            rows = cur.fetchall()
        conn.close()
        return jsonify(states=[{
            "name": r[0],
            "abbreviation": r[1],
            "capital": r[2],
            "timezone": r[3]
        } for r in rows])
    except Exception as e:
        return jsonify(error=str(e)), 500

@state_routes.route('/states/<abbr>')
def get_state_details(abbr):
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute(
                "SELECT name, capital, timezone FROM states WHERE abbreviation = %s",
                (abbr.upper(),)
            )
            state = cur.fetchone()
            if not state:
                return jsonify(error="State not found"), 404

            name, capital, timezone = state

            cur.execute(
                "SELECT name, population FROM cities WHERE state_abbr = %s ORDER BY population DESC LIMIT 5",
                (abbr.upper(),)
            )
            cities = cur.fetchall()
        conn.close()
        return jsonify({
            "name": name,
            "abbreviation": abbr.upper(),
            "capital": capital,
            "timezone": timezone,
            "top_cities": [
                {"name": c[0], "population": c[1]} for c in cities
            ]
        })
    except Exception as e:
        return jsonify(error=str(e)), 500

@state_routes.route('/states/<abbr>/cities', methods=['GET'])
def get_state_cities(abbr):
    try:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute(
                "SELECT name, population FROM cities WHERE state_abbr = %s ORDER BY population DESC LIMIT 5",
                (abbr.upper(),)
            )
            rows = cur.fetchall()
        conn.close()

        if not rows:
            return jsonify(error="No cities found for this state"), 404

        return jsonify({
            "state": abbr.upper(),
            "cities": [{"city_name": r[0], "population": r[1]} for r in rows]
        })
    except Exception as e:
        return jsonify(error=str(e)), 500
