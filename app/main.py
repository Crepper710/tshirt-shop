from fastapi import FastAPI, Response
from fastapi.responses import HTMLResponse
from jinja2 import Template, FileSystemLoader
from app.sites.index import router

app = FastAPI()


app.include_router(router)
