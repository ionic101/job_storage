from job_storage_api.routers.vacancy import vacancy_router
from fastapi import APIRouter
from typing import List


routers: List[APIRouter] = [
    vacancy_router
]

__all__ = [
    'routers'
]
