# StateFacts API

[![Docker](https://img.shields.io/badge/dockerized-yes-blue)](https://www.docker.com/)
[![Python](https://img.shields.io/badge/python-3.9-blue.svg)](https://www.python.org/)
![Platform](https://img.shields.io/badge/platform-Raspberry%20Pi-red)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
![Status](https://img.shields.io/badge/status-active-brightgreen)

**State Facts** is a containerized REST + SOAP API with a responsive dashboard that provides U.S. state facts and population data. Built with Flask, Spyne, MariaDB, and Chart.js — and deployed on Raspberry Pi.

---

## Features

- REST API endpoints for querying state info and cities
- SOAP API with WSDL support via Spyne
- Dashboard with interactive population charts (Chart.js)
- MariaDB for storage, with SQL seed scripts
- Dockerized with separate Dev and Prod setups
- Ready for CI/CD and deployment on Raspberry Pi

---

## Tech Stack

- **Backend:** Flask (REST), Spyne (SOAP), Python 3.11
- **Database:** MariaDB
- **Frontend:** HTML, JavaScript, Chart.js
- **Infra:** Docker, Docker Compose, `.env` secrets

---

## Getting Started (Dev)

Clone using SSH:

```bash
git clone git@github.com:mbulkeley/statefacts-api.git
cd flask-api
```

Or with HTTPS:

```bash
git clone https://github.com/mbulkeley/statefacts-api.git
cd flask-api
```

---

### Create a `.env` File

```env
MYSQL_ROOT_PASSWORD=yourpassword
MYSQL_DATABASE=flaskdb
MYSQL_USER=flaskuser
MYSQL_PASSWORD=yourpassword
DB_HOST=db
```

---

## REST API Endpoints

| Method | Route                     | Description                        |
|--------|---------------------------|------------------------------------|
| GET    | `/states`                 | List all states                    |
| GET    | `/states?timezone=CST`    | Filter states by timezone          |
| GET    | `/states/<abbr>`          | State details + top 5 cities       |
| GET    | `/states/<abbr>/cities`   | Top 5 cities only                  |
| GET    | `/search?q=keyword`       | (Coming soon) Search by city/state |

---

## SOAP API

- Endpoint: `POST /soap`
- WSDL: [http://localhost:5000/soap/?wsdl](http://localhost:5000/soap/?wsdl)
- Method: `get_state_info(abbr)`
- Returns: State name, capital, timezone, top cities

---

## License

MIT © [Michael Bulkeley](https://github.com/mbulkeley)