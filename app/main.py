from flask import Flask, send_from_directory
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from app.state_routes import state_routes
from app.soap_service import soap_wsgi_app


def create_app(testing=False):
    app = Flask(__name__)

    if testing:
        app.config["TESTING"] = True

    # Register REST routes
    app.register_blueprint(state_routes)

    # Error handler for visibility in CI
    @app.errorhandler(Exception)
    def handle_exception(e):
        import traceback

        print("Uncaught Exception:", e)
        traceback.print_exc()
        return {"error": str(e)}, 500

    # Serve the dashboard UI
    @app.route("/")
    def home():
        return send_from_directory("static", "dashboard.html")

    @app.route("/favicon.ico")
    def favicon():
        return send_from_directory(
            "static", "favicon.ico", mimetype="image/vnd.microsoft.icon"
        )

    return app


# WSGI entrypoint for combined REST + SOAP
app = create_app()
application = DispatcherMiddleware(app, {"/soap": soap_wsgi_app})

if __name__ == "__main__":
    from werkzeug.serving import run_simple

    run_simple("0.0.0.0", 5000, application)
