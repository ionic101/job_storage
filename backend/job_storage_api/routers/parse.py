from fastapi import APIRouter
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
import requests
from job_storage_api.schemas import VacancySchema
from typing import Any
from bs4 import BeautifulSoup
from time import sleep
from typing import Literal
from fastapi import APIRouter, Query, Depends
from job_storage_api.routers.rabota import parse_vacancies_rabota
from job_storage_api.routers.hh import parse_vacancies_hh
from job_storage_api.db.connection import get_session
from sqlalchemy.orm import Session
from job_storage_api.db.models import VacancyModel


parse_router = APIRouter(prefix='/parse', tags=['Parse'])
URLS: dict[str, str] = {
    'hh': 'https://api.hh.ru/vacancies',
    'avito': '',
}


@parse_router.post('/hh')
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
    

#@parse_router.get('/avito')
#def parse_avito():
#    return None


@parse_router.get('/')
def parse_vacancies(request: VacanciesFilter):
    request.limit = request.limit // 2
    return parse_hh(request) + parse_rabota(request)

#VacanciesFilter(limit=10, text='Программист', area='Екатеринбург', salary=0, experience_ids=['between1And3'], currency='RUR')))
