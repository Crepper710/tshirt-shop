from fastapi import APIRouter, Form
from fastapi.responses import HTMLResponse
from app.utils import j2_environment, empty_site
from pydantic import BaseModel
from typing import Union


router = APIRouter()

template = j2_environment.get_template("signup/index.j2")


class PostIndexBody(BaseModel):
    firstname: str
    lastname: str
    email: str
    password: str
    password_confirm: str
    street: str
    house_number: str
    zip_code: str
    town: str


@router.get("/signup/", response_class = HTMLResponse)
def get_index():
    return empty_site.render({
        "site": template.render({

        })
    })


@router.post("/signup/", response_class = HTMLResponse)
def post_index(
        firstname: Union[str, None] = Form(),
        lastname: Union[str, None] = Form(),
        email: Union[str, None] = Form(),
        password: Union[str, None] = Form(),
        password_confirm: Union[str, None] = Form(),
        street: Union[str, None] = Form(),
        house_number: Union[str, None] = Form(),
        zip_code: Union[str, None] = Form(),
        town: Union[str, None] = Form()
):
    print(firstname)
    print(lastname)
    print(email)
    print(password)
    print(password_confirm)
    print(street)
    print(house_number)
    print(zip_code)
    print(town)
    return get_index()
