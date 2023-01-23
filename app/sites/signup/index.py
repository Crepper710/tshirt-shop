from fastapi import APIRouter, Body
from fastapi.responses import HTMLResponse
from app.utils import j2_environment, empty_site


router = APIRouter()

template = j2_environment.get_template("signup/index.j2")


@router.get("/signup/", response_class = HTMLResponse)
def get_index():
    return empty_site.render({
        "site": template.render({

        })
    })


@router.post("/signup/", response_class = HTMLResponse)
def post_index(body = Body(embed = True)):
    print(body)
    return get_index()