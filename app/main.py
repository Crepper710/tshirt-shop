from fastapi import FastAPI, Response
from fastapi.responses import HTMLResponse
from jinja2 import Template, FileSystemLoader
from app.sites.index import router
from app.sites.signup.index import router as signup_router
from app.sites.login.index import router as login_router
from app.sites.logout.index import router as lougout_router

app = FastAPI()
# Jette: muss das in der App noch raus? Wir nutzen ja jetzt Django

app.include_router(router)
app.include_router(signup_router)
app.include_router(login_router)
#app.include_router(logout_router)
