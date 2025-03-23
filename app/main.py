from flask import Flask, send_from_directory
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from werkzeug.serving import run_simple

from state_routes import state_routes
from soap_service import soap_wsgi_app

app = Flask(__name__)
app.register_blueprint(state_routes)

@app.route('/')
def home():
    return send_from_directory('static', 'dashboard.html')

@app.route('/favicon.ico')
def favicon():
    return send_from_directory('static', 'favicon.ico', mimetype='image/vnd.microsoft.icon')


# Combine REST + SOAP
application = DispatcherMiddleware(app, {
    '/soap': soap_wsgi_app
})

if __name__ == '__main__':
    run_simple('0.0.0.0', 5000, application)
