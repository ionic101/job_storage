from sqlalchemy import create_engine
import os
from dotenv import load_dotenv
from sqlalchemy.orm import sessionmaker, Session
from typing import Generator
from job_storage_api.db import Base


def get_session() -> Generator[Session, None, None]:
    with SessionMaker() as session:
        yield session


load_dotenv()
DB_URL = os.getenv('DB_URL')
engine = create_engine(DB_URL)
Base.metadata.create_all(bind=engine)
SessionMaker = sessionmaker(bind=engine)
