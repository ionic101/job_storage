from sqlalchemy import create_engine
import os
from dotenv import load_dotenv
from sqlalchemy.orm import sessionmaker, Session
from typing import Generator
from job_storage_api.db import Base
from job_storage_api.utils.config import config


def get_session() -> Generator[Session, None, None]:
    with SessionMaker() as session:
        yield session


load_dotenv()
engine = create_engine(config.DB_URL)
Base.metadata.create_all(bind=engine)
SessionMaker = sessionmaker(bind=engine)
