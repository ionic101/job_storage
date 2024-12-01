from fastapi import APIRouter
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
import requests
from job_storage_api.schemas import VacancySchema
from typing import Any
from bs4 import BeautifulSoup
from time import sleep
from typing import Literal
from job_storage_api.routers.rabota import parse_vacancies_rabota


parse_router = APIRouter(prefix='/parse', tags=['Parse'])
URLS: dict[str, str] = {
    'hh': 'https://api.hh.ru/vacancies',
    'avito': '',
}




@parse_router.get('/hh')
def parse_vacancies_hh(request: VacanciesFilter):
    response: requests.Response = requests.get(URLS['hh'], data={'text': 'Программист', 'salary': 200000})
    if not response.ok:
        return response.status_code
    vacancies = []
    data: dict[str, Any] = response.json()['items']
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
def parse_rabota(request: VacanciesFilter):
    return parse_vacancies_rabota(request)
    

@parse_router.get('/avito')
def parse_vacancies_avito(request: VacanciesFilter):
    return {}


@parse_router.get('/')
def parse_vacancies(request: VacanciesFilter):
    sleep(1)
    return [
    {
        "name": "Грузчик",
        "employer_name": "Люкс Вода",
        "salary_from": 54000,
        "salary_to": 80000,
        "currency": "RUR",
        "area": "Екатеринбург",
        "experience_id": "noExperience",
        "published_at": "15.11.2024",
        "source_name": "hh",
        "source_link": "https://hh.ru/vacancy/110196342"
    },
    {
        "name": "Чат-специалист в поддержку",
        "employer_name": "ИП Зотов Дмитрий Олегович",
        "salary_from": 59000,
        "salary_to": None,
        "currency": "RUR",
        "area": "Екатеринбург",
        "experience_id": "noExperience",
        "published_at": "17.11.2024",
        "source_name": "hh",
        "source_link": "https://hh.ru/vacancy/109648589"
    },
    {
        "name": "Оператор call-центра",
        "employer_name": "Smarter",
        "salary_from": 35000,
        "salary_to": None,
        "currency": "RUR",
        "area": "г Волгоград",
        "experience_id": "noExperience",
        "published_at": "18.11.2024",
        "source_name": "rabota",
        "source_link": "https://www.rabota.ru/vacancy/50462116"
    },
    {
        "name": "Преподаватель испанского и английского языка",
        "employer_name": "Машенкова Марина Евгеньевна ",
        "salary_from": 52000,
        "salary_to": 78000,
        "currency": "RUR",
        "area": "Владимирская обл, г Александров",
        "experience_id": "between1And3",
        "published_at": "18.11.2024",
        "source_name": "rabota",
        "source_link": "https://www.rabota.ru/vacancy/50448809"
    },
    {
        "name": "Повар",
        "employer_name": "ООО ОКЕЙ",
        "salary_from": 54000,
        "salary_to": 60000,
        "currency": "RUR",
        "area": "Свердловская обл., Екатеринбург, парк Радуга р-н Верх-Исетский",
        "experience_id": "noExperience",
        "published_at": "18.11.2024",
        "source_name": "avito",
        "source_link": "https://www.avito.ru/ekaterinburg/vakansii/povar_1755136310"
    },
    {
        "name": "Курьер водитель на своем авто",
        "employer_name": "Анна Ткачёва, подбор водителей",
        "salary_from": 31000,
        "salary_to": 137000,
        "currency": "RUR",
        "area": "Свердловская обл., Екатеринбург",
        "experience_id": "noExperience",
        "published_at": "17.11.2024",
        "source_name": "avito",
        "source_link": "https://www.avito.ru/ekaterinburg/vakansii/kurer_voditel_na_svoem_avto_4658175769"
    }
]


#print()
#res = requests.get(URLS['hh'], data=)
#print(get_rabota_data_request(VacanciesFilter(limit=10, text='Программист', area='Екатеринбург', salary=0, experience_ids=['between1And3'], currency='RUR', source_name='работа')))
