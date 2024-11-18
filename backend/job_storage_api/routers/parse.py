from fastapi import APIRouter
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
import requests
from job_storage_api.schemas import VacancySchema
from typing import Dict, Any
from bs4 import BeautifulSoup


parse_router = APIRouter(prefix='/parse', tags=['Parse'])
URLS: Dict[str, str] = {
    'hh': 'https://api.hh.ru/vacancies',
    'rabota': '',
    'avito': ''
}


@parse_router.get('/hh')
def search_vacancies_hh(request: VacanciesFilter):
    response: requests.Response = requests.get(URLS['hh'], data={'text': 'Программист', 'salary': 200000})
    if not response.ok:
        return response.status_code
    vacancies = []
    data: Dict[str, Any] = response.json()['items']
    for vacancy in data:
        vacancy_data = requests.get(vacancy['url'])
        if not vacancy_data.ok:
            continue
        vacancy_data = vacancy_data.json()
        vacancies.append(
            VacancySchema(
                name=vacancy_data['name'],
                description=BeautifulSoup(vacancy_data['description'], 'html.parser').get_text(),
                employer_name=vacancy_data['employer']['name'],
                experience_id=vacancy_data['experience']['id'],
                currency=vacancy_data['salary']['currency'] if vacancy_data['salary'] else 'RUR',
                area=vacancy_data['area']['name'],
                source_name='hh',
                source_link=vacancy['alternate_url'],
                key_skills=[i['name'] for i in vacancy_data['key_skills']],
                salary_from=vacancy_data['salary']['from'] if vacancy_data['salary'] else None,
                salary_to=vacancy_data['salary']['to'] if vacancy_data['salary'] else None
            )
        )
    return vacancies

@parse_router.get('/rabota')
def search_vacancies_rabota(request: VacanciesFilter):
    return {}

@parse_router.get('/avito')
def search_vacancies_avito(request: VacanciesFilter):
    return {}

@parse_router.get('/')
def search_vacancies(request: VacanciesFilter):
    return search_vacancies_hh(request) | search_vacancies_rabota(request) | search_vacancies_avito(request)
