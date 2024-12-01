from fastapi import FastAPI, APIRouter
from job_storage_api.routers import routers
from typing import List
import uvicorn


def bind_routers(application: FastAPI, routers: List[APIRouter]) -> None:
    for router in routers:
        application.include_router(router)


def get_app() -> FastAPI:
    app: FastAPI = FastAPI(title='JobStorageAPI')
    bind_routers(app, routers)
    return app


def main() -> None:
    uvicorn.run(
        'job_storage_api.__main__:app',
        reload=True
    )


app: FastAPI = get_app()

if __name__ == '__main__':
    main()
