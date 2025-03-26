# Dev environment
up:
	docker compose -f docker-compose.dev.yml up --build

up-detached:
	docker compose -f docker-compose.dev.yml up -d --build

down:
	docker compose -f docker-compose.dev.yml down

logs:
	docker compose -f docker-compose.dev.yml logs -f

sh:
	docker compose -f docker-compose.dev.yml exec api bash

# Testing
test:
	docker compose -f docker-compose.dev.yml exec api pytest

# Format & lint
format:
	docker compose -f docker-compose.dev.yml exec api black app tests

lint:
	docker compose -f docker-compose.dev.yml exec api flake8 app tests
