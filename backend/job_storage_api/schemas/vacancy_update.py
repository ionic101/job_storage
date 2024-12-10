from pydantic import BaseModel, HttpUrl, field_validator
from typing import List, Literal
from url_normalize import url_normalize


class VacancyUpdate(BaseModel):
    name: str
    description: str
    employer_name: str
    experience_id: Literal['noExperience', 'between1And3', 'between3And6', 'moreThan6']
    currency: Literal['AZN', 'BYR', 'EUR', 'GEL', 'KGS', 'KZT', 'RUR', 'UAH', 'USD', 'UZS']
    area: str
    source_name: Literal['hh', 'avito', 'работа']
    source_link: str
    key_skills: List[str] | None = None
    salary_from: float | None = None
    salary_to: float | None = None
