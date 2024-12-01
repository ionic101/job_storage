from fastapi import APIRouter, Query, Depends
from job_storage_api.schemas.vacancy import VacancySchema
from job_storage_api.db.models import VacancyModel
from typing import List, Annotated
from job_storage_api.db.connection import get_session
from sqlalchemy.orm import Session
from time import sleep



vacancy_router = APIRouter(prefix='/vacancy', tags=['Vacancy'])
EXAMPLE_VACANCY: VacancySchema = VacancySchema(
    name='Example name of vacancy',
    description='Example of description',
    employer_name='Example of employer name',
    experience_id='noExperience',
    currency='RUR',
    source_name='avito',
    source_link='https://www.avito.ru/',
    area='Moscow'
)


#TODO
@vacancy_router.get('/search')
def delete_vacancy(count: int):
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



#TODO
@vacancy_router.get('/{id}', response_model=VacancySchema)
def get_vacancy_by_id(id: int):
    return EXAMPLE_VACANCY


@vacancy_router.post('/')
def create_vacancy(vacancy_request: VacancySchema, session: Session = Depends(get_session)):
    vacancy: VacancyModel = VacancyModel(
        **vacancy_request.dict()
    )
    session.add(vacancy)
    session.commit()
    session.refresh(vacancy)
    return {'message': 'success'}

@vacancy_router.put('/')
def put_vacancy():
    return {}


@vacancy_router.delete('/')
def delete_vacancy():
    return {}