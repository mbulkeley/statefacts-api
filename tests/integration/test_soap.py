import requests


def test_soap_get_state_info():
    soap_url = "http://localhost:5000/soap"
    headers = {"Content-Type": "text/xml; charset=utf-8"}

    payload = """<?xml version="1.0" encoding="UTF-8"?>
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                      xmlns:spy="spyne.state.service">
       <soapenv:Header/>
       <soapenv:Body>
          <spy:get_state_info>
             <spy:abbr>CO</spy:abbr>
          </spy:get_state_info>
       </soapenv:Body>
    </soapenv:Envelope>"""

    response = requests.post(soap_url, data=payload, headers=headers)

    print("Status:", response.status_code)
    print("Body:", response.text)

    assert response.status_code == 200
    assert "Denver" in response.text  # or whatever top city you expect
