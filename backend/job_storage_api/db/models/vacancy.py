from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, DateTime, Integer, String, Float, ARRAY
from sqlalchemy_utils import URLType
from job_storage_api.db import Base



class VacancyModel(Base):
    __tablename__ = 'vacancy'
    id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String)
    description = Column(String)
    employer_name = Column(String)
    experience_id = Column(Integer)
    currency = Column(String)
    source = Column(String)
    source_link = Column(URLType)
    key_skills = Column(ARRAY(String))
    salary_from = Column(Float)
    salary_to = Column(Float)
