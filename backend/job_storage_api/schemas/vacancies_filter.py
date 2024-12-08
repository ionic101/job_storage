from pydantic import BaseModel
from typing import Literal


class VacanciesFilter(BaseModel):
    limit: int
    text: str
    area: str
    salary: int
    experience_ids: list[Literal['noExperience', 'between1And3', 'between3And6', 'moreThan6']]
    currency: Literal['AZN', 'BYR', 'EUR', 'GEL', 'KGS', 'KZT', 'RUR', 'UAH', 'USD', 'UZS']
