from django.http import HttpRequest
from django.shortcuts import render, HttpResponse, Http404
from django.template import loader


def list_(request: HttpRequest):
    if request.method == "GET":
        search = request.GET.get("q", "pa")
        sort = request.GET.get("s", "")
        print(search, sort)
        empty_template = loader.get_template("empty_site.html")
        template = loader.get_template("product/list.html")
        return HttpResponse(empty_template.render({"site": template.render({"search": search, "sort": sort}, request)}, request))
    return Http404()


def info():
    raise Http404()
