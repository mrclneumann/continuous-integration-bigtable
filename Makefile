all: build black isort flake8 unit integration clean
build:
	docker-compose up --build --force-recreate --remove-orphans --no-start sample
black:
	docker-compose run sample black --check .
isort:
	docker-compose run sample isort --check .
flake8:
	docker-compose run sample flake8
unit:
	docker-compose run sample python -m pytest tests/unit/
integration:
	docker-compose run sample python -m pytest tests/integration/
clean:
	docker-compose down --remove-orphans