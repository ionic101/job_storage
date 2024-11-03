APPLICATION_NAME = job_storage_api

run:
	poetry run python -m "$(APPLICATION_NAME)"

migrate:
	cd $(APPLICATION_NAME)/db && alembic upgrade head
