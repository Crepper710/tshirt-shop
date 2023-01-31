from django.http import HttpRequest
from django.shortcuts import render, HttpResponse, redirect
from django.template import loader
from .forms import SignUpForm, LogInForm
import db
import token_util


def signup(request: HttpRequest):
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            firstname = form.cleaned_data.get("firstname")
            lastname = form.cleaned_data.get("lastname")
            password = form.cleaned_data.get("password")
            password_c = form.cleaned_data.get("password_confirm")
            email = form.cleaned_data.get("email")
            street = form.cleaned_data.get("street")
            house_number = form.cleaned_data.get("house_number")
            zip_code = form.cleaned_data.get("zip_code")
            town = form.cleaned_data.get("town")

            if password != password_c:
                pass  # TODO throw error
            with db.open_connection() as con:
                con: db.connection
                with con.cursor() as cur:
                    cur: db.cursor

                    cur.execute("SELECT * FROM benutzer WHERE email = %(email)s", {"email": email})
                    temp = cur.fetchall()

                    if len(temp) != 0:
                        pass  # TODO throw error

                    cur.execute(
                        """INSERT INTO benutzer (vorname, nachname, strasse, plz, ort, email, passwort)
                        VALUES (%(firstname)s, %(lastname)s, %(street)s, %(zip_code)s, %(town)s, %(email)s, %(password)s)""",
                        {
                            "firstname": firstname,
                            "lastname": lastname,
                            "password": password,
                            "email": email,
                            "street": f"{street} {house_number}",
                            "zip_code": zip_code,
                            "town": town
                        }
                    )

                    cur.execute("SELECT benutzerid FROM benutzer WHERE email = %(email)s", {"email": email})

                    id_ = cur.fetchone()
                    token = token_util.gen_token(id_)

                    response = redirect("/")  # TODO

                    response.set_cookie("token", token)

                    return response
    empty_template = loader.get_template("empty_site.html")
    template = loader.get_template("user/signup.html")
    return HttpResponse(empty_template.render({"site": template.render({}, request)}, request))


def login(request: HttpRequest):
    if request.method == "POST":
        form = LogInForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data.get("email", "")
            password = form.cleaned_data.get("password", "")
            with db.open_connection() as con:
                con: db.connection
                with con.cursor() as cur:
                    cur: db.cursor
                    cur.execute("SELECT benutzerid, passwort FROM benutzer WHERE email = %(email)s", {"email": email})
                    temp = cur.fetchall()

                    if 0 < len(temp):
                        id_ = temp[0][0]
                        password_ = temp[0][1]

                        if password == password_:
                            token = token_util.gen_token(id_)
                            response = redirect("/")  # TODO
                            response.set_cookie("token", token)
                            return response
    empty_template = loader.get_template("empty_site.html")
    template = loader.get_template("user/login.html")
    return HttpResponse(empty_template.render({"site": template.render({}, request)}, request))


#Jette: Proforma schon mal nen Logout gemacht
def logout(request: HttpRequest):
    response = redirect("/")  # TODO
    response.delete_cookie("token")
    return response
