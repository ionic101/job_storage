from pydantic import BaseModel


class VacanciesFilter(BaseModel):
    text: str
    experience: str
    currency: str
    salary: int