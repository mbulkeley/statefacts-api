from flask import Flask, jsonify
import pymysql
import os

app = Flask(__name__)

db_config = {
    "host": os.environ.get("DB_HOST", "localhost"),
    "user": os.environ.get("DB_USER", "root"),
    "password": os.environ.get("DB_PASSWORD", ""),
    "database": os.environ.get("DB_NAME", "statefacts")
}

@app.route('/states')
def get_states():
    try:
        conn = pymysql.connect(**db_config)
        with conn.cursor() as cur:
            cur.execute("SELECT name, abbreviation, capital, timezone FROM states")
            rows = cur.fetchall()
        conn.close()
        return jsonify(states=[{
            "name": r[0], "abbreviation": r[1],
            "capital": r[2], "timezone": r[3]
        } for r in rows])
    except Exception as e:
        return jsonify(error=str(e)), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
