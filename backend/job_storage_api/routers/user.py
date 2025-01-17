from fastapi import APIRouter, Depends, HTTPException
from job_storage_api.schemas.vacancy import VacancySchema
from job_storage_api.db.models import VacancyModel
from job_storage_api.db.connection import get_session
from sqlalchemy.orm import Session
from job_storage_api.schemas import VacanciesFilter, VacancyUpdate
from job_storage_api.schemas.token import TokenResponse
from job_storage_api.schemas.register import RegisterRequest
from job_storage_api.db.models.user import UserModel
from passlib.context import CryptContext
from datetime import datetime, timedelta
import jwt


SECRET_KEY = "f13Dqo23as"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

user_router = APIRouter(prefix='/user', tags=['User'])
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def hash_password(password: str) -> str:
    return pwd_context.hash(password)

def create_access_token(data: dict, expires_delta: timedelta | None = None):
    to_encode = data.copy()
    expire = datetime.utcnow() + (expires_delta or timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES))
    to_encode.update({"exp": expire})
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)

@user_router.post("/register", response_model=TokenResponse)
def register_user(request: RegisterRequest, db: Session = Depends(get_session)):
    # Проверка, свободен ли логин
    if db.query(UserModel).filter(UserModel.username == request.username).first():
        raise HTTPException(status_code=400, detail="Username is already taken")

    # Хэширование пароля
    hashed_password = hash_password(request.password)

    # Создание записи в БД
    new_user = UserModel(
        username=request.username,
        hashed_password=hashed_password,
        first_name=request.first_name,
        last_name=request.last_name,
        birth_date=request.birth_date
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    # Генерация JWT токена
    access_token = create_access_token(data={"sub": new_user.username})

    return {"access_token": access_token, "token_type": "bearer"}
