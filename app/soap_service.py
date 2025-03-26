from spyne import Application, rpc, ServiceBase, Unicode, Iterable, ComplexModel
from spyne.protocol.soap import Soap11
from spyne.server.wsgi import WsgiApplication

from app.db import get_connection

class City(ComplexModel):
    name = Unicode
    population = Unicode

class StateInfo(ComplexModel):
    name = Unicode
    abbreviation = Unicode
    capital = Unicode
    timezone = Unicode
    top_cities = Iterable(City)

class StateService(ServiceBase):

    @rpc(Unicode, _returns=StateInfo)
    def get_state_info(ctx, abbr):
        try:
            conn = get_connection()
            with conn.cursor() as cur:
                cur.execute(
                    "SELECT name, capital, timezone FROM states WHERE abbreviation = %s",
                    (abbr.upper(),)
                )
                state = cur.fetchone()
                if not state:
                    return StateInfo(name="Unknown")

                name, capital, timezone = state
                cur.execute(
                    "SELECT name, population FROM cities WHERE state_abbr = %s ORDER BY population DESC LIMIT 5",
                    (abbr.upper(),)
                )
                cities = [City(name=c[0], population=str(c[1])) for c in cur.fetchall()]
            conn.close()
            return StateInfo(
                name=name,
                abbreviation=abbr.upper(),
                capital=capital,
                timezone=timezone,
                top_cities=cities
            )
        except Exception as e:
            return StateInfo(name="Error: " + str(e))

soap_app = Application(
    [StateService],
    tns='spyne.state.service',
    in_protocol=Soap11(validator='lxml'),
    out_protocol=Soap11()
)

soap_wsgi_app = WsgiApplication(soap_app)
