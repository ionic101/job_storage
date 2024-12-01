from job_storage_api.schemas.vacancies_filter import VacanciesFilter
from job_storage_api.schemas import VacancySchema
from typing import Any
from bs4 import BeautifulSoup
import requests


URLS: dict[str, str] = {
    'hh': 'https://api.hh.ru/vacancies',
    'hh_area': 'https://api.hh.ru/suggests/area_leaves'
}


def get_formated_vacancy(vacancy: dict[str, Any]) -> VacancySchema:
    return VacancySchema(
        name=vacancy['name'],
        description=BeautifulSoup(vacancy['description'], 'html.parser').get_text(),
        employer_name=vacancy['employer']['name'],
        experience_id=vacancy['experience']['id'],
        currency=vacancy['salary']['currency'] if vacancy['salary'] else 'RUR',
        area=vacancy['area']['name'],
        source_name='hh',
        source_link=vacancy['alternate_url'],
        key_skills=[i['name'] for i in vacancy['key_skills']],
        salary_from=vacancy['salary']['from'] if vacancy['salary'] else None,
        salary_to=vacancy['salary']['to'] if vacancy['salary'] else None
    )


def get_area_id(area_name: str) -> str | None:
    response: requests.Response = requests.get(URLS['hh_area'], data={'text': area_name})
    if not response.ok:
        return None
    areas: list[dict[str, str]] = response.json()['items']
    for area in areas:
        if area['text'] == area_name:
            return area['id']
    return None


def get_hh_data_request(request: VacanciesFilter) -> dict[str, Any]:
    return {
        'per_page': request.limit,
        'text': request.text,
        'area': get_area_id(request.area),
        'salary': request.salary,
        'experience': request.experience_ids,
        'currency': request.currency
    }


def parse_vacancies_hh(request: VacanciesFilter) -> list[VacancySchema]:
    response: requests.Response = requests.get(URLS['hh'], data=get_hh_data_request(request))
    if not response.ok:
        return response.text
    vacancies = []
    data: dict[str, Any] = response.json()['items']
    for vacancy in data:
        vacancy_data = requests.get(vacancy['url'])
        if not vacancy_data.ok:
            continue
        vacancy_data = vacancy_data.json()
        vacancies.append(get_formated_vacancy(vacancy_data))
    return vacancies
