from pydantic import BaseModel, HttpUrl
from typing import List


class VacancySchema(BaseModel):
    name: str
    description: str
    employer_name: str
    experience_id: int
    currency: str
    source: str
    source_link: HttpUrl
    key_skills: List[str] | None = None
    salary_from: int | None = None
    salary_to: int | None = None
