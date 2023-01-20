from fastapi import APIRouter
from fastapi.responses import HTMLResponse
from app.utils import j2_environment, empty_site


router = APIRouter()

index_template = j2_environment.get_template("index.j2")


@router.get("/", response_class = HTMLResponse)
def index():
    return empty_site.render({
        "site": index_template.render({
            "stuff": "lol"
        })
    })
