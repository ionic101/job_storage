from job_storage_api.db import Base
from sqlalchemy import Column, Integer, String, JSON, ARRAY, ForeignKey
from sqlalchemy.orm import relationship
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from job_storage_api.db.models.user import UserModel


class ResumeModel(Base):
    __tablename__ = 'resume'
    id = Column(Integer, primary_key=True, autoincrement=True)
    user_id = Column(Integer, ForeignKey('user.id'))
    owner = relationship('UserModel', back_populates='resumes')
    post_name = Column(String)
    description = Column(String)
    experience = Column(JSON)
    education = Column(JSON)
    area = Column(String)
    work_mode = Column(String)
    skills = Column(ARRAY(String))
    links = Column(ARRAY(String))
