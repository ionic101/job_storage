from fastapi import APIRouter
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
import requests


parse_router = APIRouter(prefix='/parse', tags=['Parse'])
URL: str = 'https://api.hh.ru/vacancies'


@parse_router.get('/')
def search_vacancies(request: VacanciesFilter):
    response = requests.get(URL, data=request.dict())
    return response.json()
