APPLICATION_NAME = job_storage_api

run:
	poetry run python -m "$(APPLICATION_NAME)"

migrate:
	cd $(APPLICATION_NAME)/db && alembic upgrade head

revision:
	cd $(APPLICATION_NAME)/db && alembic revision --autogenerate

downgrade:
	cd $(APPLICATION_NAME)/db && alembic downgrade -1
