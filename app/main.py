from fastapi import FastAPI, Response
from fastapi.responses import HTMLResponse
from jinja2 import Template, FileSystemLoader
from app.sites.index import router
from app.sites.signup.index import router as signup_router

app = FastAPI()


app.include_router(router)
app.include_router(signup_router)
