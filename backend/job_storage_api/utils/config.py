from os import environ
from pydantic_settings import BaseSettings


class Config(BaseSettings):
    _CONTAINER_NAME: str = 'db'
    DB_NAME: str = environ.get('DB_NAME', 'JobStorage')
    DB_USERNAME: str = environ.get('DB_USERNAME', 'admin')
    DB_PASSWORD: str = environ.get('DB_PASSWORD', 'admin')
    DB_PORT: int = int(environ.get('DB_PORT', 5432))
    APP_HOST: str = environ.get('APP_HOST', '0.0.0.0')
    APP_PORT: int = int(environ.get('APP_PORT', 8000))

    @property
    def DB_URL(self) -> str:
        return f'postgresql://{self.DB_USERNAME}:{self.DB_PASSWORD}@{self._CONTAINER_NAME}:{self.DB_PORT}/{self.DB_NAME}'


config: Config = Config()