# Dev environment
up:
	docker compose -f docker-compose.dev.yml up --build

up-detached:
	docker compose -f docker-compose.dev.yml up -d --build

down:
	docker compose -f docker-compose.dev.yml down -v

build:
	docker compose -f docker-compose.dev.yml build

logs:
	docker compose -f docker-compose.dev.yml logs -f

sh:
	docker compose -f docker-compose.dev.yml exec api bash

# Testing
test:
	docker compose -f docker-compose.dev.yml exec api pytest tests/

# Format & lint
format:
	docker compose -f docker-compose.dev.yml exec api black app tests

lint:
	docker compose -f docker-compose.dev.yml exec api flake8 app tests
