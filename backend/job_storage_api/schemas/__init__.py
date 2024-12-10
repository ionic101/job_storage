from typing import List, Type
from pydantic import BaseModel
from job_storage_api.schemas.vacancy import VacancySchema
from job_storage_api.schemas.vacancies_filter import VacanciesFilter
from job_storage_api.schemas.vacancy_update import VacancyUpdate


schemas: List[Type[BaseModel]] = [
    VacancySchema,
    VacanciesFilter,
    VacancyUpdate
]

__all__ = [
    'schemas'
]
