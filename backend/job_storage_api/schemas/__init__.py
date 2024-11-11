from typing import List
from pydantic import BaseModel
from job_storage_api.schemas.vacancy import VacancySchema


schemas: List[BaseModel] = [
    VacancySchema
]

__all__ = [
    'schemas'
]
