from pydantic import BaseModel
from typing import Literal


class VacanciesFilter(BaseModel):
    limit: int = 10
    text: str = ''
    area: str | None = None
    salary: int = 0
    experience_ids: list[Literal['noExperience', 'between1And3', 'between3And6', 'moreThan6']] | None = None
    currency: Literal['AZN', 'BYR', 'EUR', 'GEL', 'KGS', 'KZT', 'RUR', 'UAH', 'USD', 'UZS'] = 'RUR'
