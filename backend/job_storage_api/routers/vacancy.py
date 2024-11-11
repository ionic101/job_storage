from fastapi import APIRouter, Query, Depends
from job_storage_api.schemas.vacancy import VacancySchema
from job_storage_api.db.models import VacancyModel
from typing import List, Annotated
from job_storage_api.db.connection import get_session
from sqlalchemy.orm import Session



vacancy_router = APIRouter(prefix='/vacancy', tags=['Vacancy'])
EXAMPLE_VACANCY: VacancySchema = VacancySchema(name='Example name of vacancy',
    description='Example of description', employer_name='Example of employer name',
    experience_id=1, currency='RU', source='avito', source_link='https://www.avito.ru/')


#TODO
@vacancy_router.get('/search', response_model=List[VacancySchema])
def search_vacancies(request: str, key_skills: Annotated[List[str] | None, Query()] = None,
    experience_id: int | None = None, employer_name: str | None = None,
    salary_from: int | None = None, salary_to: int | None = None,
    currency: str | None = None, source: str | None = None):
    return [EXAMPLE_VACANCY, EXAMPLE_VACANCY, EXAMPLE_VACANCY]


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
