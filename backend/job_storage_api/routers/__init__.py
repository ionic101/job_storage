from job_storage_api.routers.vacancy import vacancy_router
from job_storage_api.routers.parse import parse_router
from job_storage_api.routers.resume import resume_router
from fastapi import APIRouter
from typing import List


routers: List[APIRouter] = [
    vacancy_router,
    parse_router,
    resume_router
]

__all__ = [
    'routers'
]
