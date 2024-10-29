from typing import List
from pydantic import BaseModel
from job_storage_api.schemas.vacancy import Vacancy


schemas: List[BaseModel] = [
    Vacancy
]

__all__ = [
    'schemas'
]
