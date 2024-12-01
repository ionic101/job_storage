from typing import Literal, Any
import requests
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
from job_storage_api.schemas.vacancy import VacancySchema
from bs4 import BeautifulSoup


URLS: dict[str, str] = {
    'rabota_vacancy': 'https://www.rabota.ru/vacancy/',
    'rabota': 'https://www.rabota.ru/api-web/v5/vacancies/search.json',
    'rabota_area_id': 'https://www.rabota.ru/api-web/v4/regions/suggest.json'
}
DATA: dict[str, dict[str, Any]] = {
    'rabota_area_id': {
        "request": {
            "filter": {
                "query": None
            }
        }
    }
}
TO_RABOTA_EXPERIENCE_IDS: dict[Literal['noExperience', 'between1And3', 'between3And6', 'moreThan6'], set[Literal[0, 1, 2, 3, 4, 5]]] = {
    'noExperience': {0, 1},
    'between1And3': {1, 2, 3},
    'between3And6': {3, 4},
    'moreThan6': {4, 5}
}
FROM_RABOTA_EXPERIENCE_IDS: dict[Literal[0, 1, 2, 3, 4, 5], Literal['noExperience', 'between1And3', 'between3And6', 'moreThan6']] = {
    0: 'noExperience',
    1: 'between1And3',
    2: 'between1And3',
    3: 'between3And6',
    4: 'between3And6',
    5: 'moreThan6'
}


def get_rabota_experience_ids(experience_ids: list[Literal['noExperience', 'between1And3', 'between3And6', 'moreThan6']]) -> list[Literal[0, 1, 2, 3, 4, 5]]:
    experience_ids_sets: list[set] = [TO_RABOTA_EXPERIENCE_IDS[experience_id] for experience_id in experience_ids]
    if experience_ids_sets:
        return list(set.union(*experience_ids_sets))
    return []


def get_rabota_area_id(area_name: str) -> int | None:
    data: dict[str, Any] = DATA['rabota_area_id']
    data['request']['filter']['query'] = area_name
    response: requests.Response = requests.post(URLS['rabota_area_id'], json=data)
    if not response.ok:
        return None
    regions: list[dict[str, Any]] = response.json()['response']['regions']
    for region in regions:
        if region['name'] == area_name:
            return region['id']
    return None


def get_rabota_data_request(vacancies_filter: VacanciesFilter) -> dict[str, Any]:
    return {
        'request': {
            'limit': vacancies_filter.limit,
            'query': vacancies_filter.text,
            'filters': {
                'experience_ids': get_rabota_experience_ids(vacancies_filter.experience_ids), # type: ignore
                'min_salary': vacancies_filter.salary
            },
            'location': {
                'region_id': get_rabota_area_id(vacancies_filter.area)
            }
        }
    }


#TODO: experience_id, currency, key_skills
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


def parse_vacancies_rabota(request: VacanciesFilter):
    response: requests.Response = requests.post(URLS['rabota'], json=get_rabota_data_request(request))
    if not response.ok:
        return response.json()
    vacancies: list[dict[str, Any]] = response.json()['response']['vacancies']
    return list(map(get_formated_vacancy, vacancies))
