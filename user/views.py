from django.http import HttpRequest
from django.shortcuts import render, HttpResponse
from django.template import loader
from .forms import SignUpForm


def signup(request: HttpRequest):
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            print(request.POST)
    empty_template = loader.get_template("empty_site.html")
    template = loader.get_template("user/signup.html")
    return HttpResponse(empty_template.render({"site": template.render({}, request)}, request))
