FROM python:3.12
RUN pip install poetry==1.7.1

WORKDIR /jobstorage
COPY . /jobstorage

RUN poetry install
CMD poetry run python -m job_storage_api