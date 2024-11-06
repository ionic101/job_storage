from job_storage_api.db import Base
from sqlalchemy import Column, Integer, String


class User(Base):
    id = Column(Integer, primary_key=True, autoincrement=True)
    full_name = Column(String)
    password_hash = Column(String)
    email = Column(String)
    date_of_birth = Column(String)
    resume_id = Column(Integer)
