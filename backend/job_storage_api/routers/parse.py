from fastapi import APIRouter
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
import requests
from typing import Dict


parse_router = APIRouter(prefix='/parse', tags=['Parse'])
URLS: Dict[str, str] = {
    'hh': 'https://api.hh.ru/vacancies',
    'rabota': '',
    'avito': ''
}


@parse_router.get('/hh')
def search_vacancies_hh(request: VacanciesFilter):
    response = requests.get(URLS['hh'], data=request.dict())
    return response.json()

@parse_router.get('/rabota')
def search_vacancies_rabota(request: VacanciesFilter):
    return {}

@parse_router.get('/avito')
def search_vacancies_avito(request: VacanciesFilter):
    return {}

@parse_router.get('/')
def search_vacancies(request: VacanciesFilter):
    return search_vacancies_hh(request) | search_vacancies_rabota(request) | search_vacancies_avito(request)
