from fastapi import APIRouter, Depends, HTTPException
from job_storage_api.schemas.vacancy import VacancySchema
from job_storage_api.db.models import VacancyModel
from job_storage_api.db.connection import get_session
from sqlalchemy.orm import Session
from job_storage_api.schemas import VacanciesFilter, VacancyUpdate
import requests
from job_storage_api.schemas.resume_request import ResumeRequest


resume_router = APIRouter(prefix='/resume', tags=['Resume'])
token_url = 'https://hdstockimages.com/wp-admin/admin-ajax.php'
GPT_IP = 'http://195.179.229.119/gpt/api.php'
# model = 'gpt-4'
# model = 'gpt-4-32k'
# model = 'gpt-3.5-turbo-0125'
default_model = 'gpt-4'


@resume_router.get('/analyse')
def get_vacancy_by_id(request: ResumeRequest):

    headers = {
        'action':'generate_api_key',
        'email': request.mail,
        'nonce':'6112f5a051'
    }
    response = requests.post(url=token_url, data=headers)
    if not response.ok:
        return {'message': 'error with api token'}
    api_key = response.json().get('api_key')

    prompt = f'Оцени мое резюме и посоветуй, что можно улучшить: {request.resume}'
    
    
    model = default_model
    api_url = f'{GPT_IP}?prompt={prompt}&api_key={api_key}&model={model}'
    response = requests.get(api_url)
    return response.json()
