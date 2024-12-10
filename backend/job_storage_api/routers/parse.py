from fastapi import APIRouter
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
from job_storage_api.schemas import VacancySchema
from fastapi import APIRouter, Depends
from job_storage_api.routers.parse_utils.rabota import parse_vacancies_rabota
from job_storage_api.routers.parse_utils.hh import parse_vacancies_hh
from job_storage_api.db.connection import get_session
from sqlalchemy.orm import Session
from job_storage_api.db.models import VacancyModel


parse_router = APIRouter(prefix='/parse', tags=['Parse'])


@parse_router.get('/hh')
def parse_hh(request: VacanciesFilter, session: Session = Depends(get_session)) -> list[VacancySchema]:
    vacancies: list[VacancySchema] = parse_vacancies_hh(request)
    for vacancy in vacancies:
        vacancy = VacancyModel(
            **vacancy.dict()
        )
        session.add(vacancy)
        session.commit()
        session.refresh(vacancy)
    return vacancies


@parse_router.get('/rabota')
def parse_rabota(request: VacanciesFilter) -> list[VacancySchema]:
    return parse_vacancies_rabota(request)
    

@parse_router.get('/avito')
def parse_avito():
    return {'message': 'not work'}


@parse_router.get('/')
def parse_vacancies(request: VacanciesFilter):
    request.limit = request.limit // 2
    return parse_hh(request) + parse_rabota(request)
