from django.http import HttpRequest
from django.shortcuts import HttpResponse
from django.template import loader


def start_page(request: HttpRequest):
    empty_template = loader.get_template("empty_site.html")
    template = loader.get_template("start_page/start_page.html")
    return HttpResponse(empty_template.render({
        "site": template.render({}, request)
    }, request))
