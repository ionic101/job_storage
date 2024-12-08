FROM python:3.12
RUN pip install poetry

WORKDIR /jobstorage
COPY . /jobstorage

RUN poetry install
CMD poetry run python -m job_storage_api