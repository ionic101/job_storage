from pydantic import BaseModel, HttpUrl, field_validator
from typing import List
from url_normalize import url_normalize


class VacancySchema(BaseModel):
    name: str
    description: str
    employer_name: str
    experience_id: int
    currency: str
    source: str
    source_link: HttpUrl
    key_skills: List[str] | None = None
    salary_from: float | None = None
    salary_to: float | None = None

    @field_validator('source_link')
    def convert_url_to_str(cls, v):
        return str(v)
