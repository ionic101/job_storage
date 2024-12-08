from typing import Any
import requests
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
from job_storage_api.schemas.vacancy import VacancySchema
from bs4 import BeautifulSoup


URLS: dict[str, str] = {
    'avito': 'https://www.avito.ru/web/1/slocations?q=Москва'
}


def get_avito_data_request(vacancies_filter: VacanciesFilter) -> dict[str, Any]:
    return {}


def get_formated_vacancy(vacancy: dict[str, Any]) -> VacancySchema:
    return VacancySchema(
        name=vacancy['title'],
        description=BeautifulSoup(vacancy['description'], 'html.parser').get_text(),
        employer_name=vacancy['company']['name'],
        experience_id='noExperience',
        currency='RUR',
        area=vacancy['places'][0]['name'],
        source_name='работа',
        source_link=URLS['rabota_vacancy'] + str(vacancy['id']),
        salary_from=None if vacancy.get('salary') is None else vacancy['salary']['from'],
        salary_to=None if vacancy.get('salary') is None else vacancy['salary']['to'],
    )


def parse_vacancies_avito(request: VacanciesFilter):
    response: requests.Response = requests.post(URLS['rabota'], json=get_avito_data_request(request))
    if not response.ok:
        return response.json()
    vacancies: list[dict[str, Any]] = response.json()['response']['vacancies']
    return list(map(get_formated_vacancy, vacancies))
