from pydantic import BaseModel


class ResumeRequest(BaseModel):
    mail: str
    resume: str
