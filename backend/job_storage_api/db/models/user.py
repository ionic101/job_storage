from job_storage_api.db import Base
from sqlalchemy import Column, Integer, String, Date
from sqlalchemy.orm import relationship
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from job_storage_api.db.models.resume import ResumeModel


class UserModel(Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True, autoincrement=True)
    full_name = Column(String)
    password_hash = Column(String)
    email = Column(String)
    date_of_birth = Column(Date)
    resume_id = relationship('ResumeModel', back_populates='owner')
