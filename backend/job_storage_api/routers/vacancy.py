from fastapi import APIRouter, Query
from job_storage_api.schemas.vacancy import Vacancy
from typing import List, Annotated


vacancy_router = APIRouter(prefix='/vacancy', tags=['Vacancy'])
EXAMPLE_VACANCY: Vacancy = Vacancy(name='Example name of vacancy',
    description='Example of description', employer_name='Example of employer name',
    experience_id=1, currency='RU', source_name='avito', source_link='https://www.avito.ru/')


#TODO
@vacancy_router.get('/search', response_model=List[Vacancy])
def search_vacancies(request: str, key_skills: Annotated[List[str] | None, Query()] = None,
    experience_id: int | None = None, employer_name: str | None = None,
    salary_from: int | None = None, salary_to: int | None = None,
    currency: str | None = None, source_name: str | None = None) -> List[Vacancy]:
    return [EXAMPLE_VACANCY, EXAMPLE_VACANCY, EXAMPLE_VACANCY]


#TODO
@vacancy_router.get('/{id}', response_model=Vacancy)
def get_vacancy_by_id(id: int) -> Vacancy:
    return EXAMPLE_VACANCY
