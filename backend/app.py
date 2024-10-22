from fastapi import FastAPI
from pydantic import BaseModel
from datetime import datetime


app = FastAPI()


class UserRegistration(BaseModel):
    username: str
    email: str
    password: str


@app.get("/vacancies")
def get_vacancies():
    return VACANCIES_DB


@app.post("/register")
def register_user(user: UserRegistration):
    return {"message": "User registered successfully"}


VACANCIES_DB = [
    {"id": 1, "title": "Python Developer", "company": "Company A", "location": "City A", "job_type": "Full-time", "salary": 100000, "description": "Python Developer needed", "date_posted": datetime.now()},
    {"id": 2, "title": "Frontend Developer", "company": "Company B", "location": "City B", "job_type": "Part-time", "salary": 70000, "description": "Frontend Developer needed", "date_posted": datetime.now()},
]

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, port=8020)
