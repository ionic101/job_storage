from pydantic import BaseModel
from typing import Literal


class VacanciesFilter(BaseModel):
    text: str
    experience_id: Literal['noExperience', 'between1And3', 'between3And6', 'moreThan6']
    currency: Literal['AZN', 'BYR', 'EUR', 'GEL', 'KGS', 'KZT', 'RUR', 'UAH', 'USD', 'UZS']
    salary: int
