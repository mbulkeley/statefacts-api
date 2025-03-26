FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    gcc \
    libxml2-dev \
    libxslt1-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY requirements-dev.txt requirements.txt ./
RUN pip install --no-cache-dir -r requirements-dev.txt

COPY . .

EXPOSE 5000

# Wait for DB, then run Flask
CMD ["flask", "run", "--host=0.0.0.0"]
# CMD ["scripts/wait-for-it.sh", "db:3306", "--timeout=90", "--strict", "--", "flask", "run", "--host=0.0.0.0"]
