from fastapi import APIRouter, Depends, HTTPException
from job_storage_api.schemas.vacancy import VacancySchema
from job_storage_api.db.models import VacancyModel
from job_storage_api.db.connection import get_session
from sqlalchemy.orm import Session
from job_storage_api.schemas import VacanciesFilter, VacancyUpdate


vacancy_router = APIRouter(prefix='/vacancy', tags=['Vacancy'])

@vacancy_router.get('/{vacancy_id}', response_model=VacancySchema)
def get_vacancy_by_id(vacancy_id: int, db: Session = Depends(get_session)):
    vacancy = db.query(VacancyModel).filter(VacancyModel.id == vacancy_id).first()
    if not vacancy:
        raise HTTPException(status_code=404, detail="Vacancy not found")
    return vacancy


@vacancy_router.get('/search')
def search_vacancies(request: VacanciesFilter, db: Session = Depends(get_session)):
    return db.query(VacancyModel).all()


@vacancy_router.post('/')
def create_vacancy(vacancy_request: VacancySchema, session: Session = Depends(get_session)):
    vacancy: VacancyModel = VacancyModel(
        **vacancy_request.dict()
    )
    session.add(vacancy)
    session.commit()
    session.refresh(vacancy)
    return {'message': 'success'}


@vacancy_router.put('/{vacancy_id}')
def put_vacancy(vacancy_id: int, vacancy: VacancyUpdate, db: Session = Depends(get_session)):
    db_vacancy = db.query(VacancyModel).filter(VacancyModel.id == vacancy_id).first()
    if not db_vacancy:
        raise HTTPException(status_code=404, detail="Vacancy not found")
    
    for key, value in vacancy.dict(exclude_unset=True).items():
        setattr(db_vacancy, key, value)

    db.commit()
    db.refresh(db_vacancy)
    return db_vacancy


@vacancy_router.delete('/{vacancy_id}')
def delete_vacancy(vacancy_id: int, db: Session = Depends(get_session)):
    db_vacancy = db.query(VacancyModel).filter(VacancyModel.id == vacancy_id).first()
    if not db_vacancy:
        raise HTTPException(status_code=404, detail="Vacancy not found")
    
    db.delete(db_vacancy)
    db.commit()
    return {"detail": "Vacancy deleted"}
