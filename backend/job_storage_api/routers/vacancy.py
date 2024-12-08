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
def find_vacancy(count: int):
    return {}


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
def find_vacancy():
    return {}