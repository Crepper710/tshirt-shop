from django.http import HttpRequest
from django.shortcuts import render, HttpResponse, Http404
from django.template import loader
import db
import json


def list_(request: HttpRequest):
    if request.method == "GET":
        search = request.GET.get("q", "pa")
        sort = request.GET.get("s", "")
        page = request.GET.get("p", "1")
        sort_query = ""
        if sort == "pd":
            sort_query = "ORDER BY preis DESC"
        else:
            sort_query = "ORDER BY preis ASC"
            sort = "pa"
        try:
            page = int(page)
        except ValueError:
            page = 1
        article = []
        with db.open_connection() as con:
            con: db.connection
            with con.cursor() as cur:
                cur: db.cursor
                cur.execute(f"SELECT artikel.artikelid, artikel.artikelbezeichnung, artikel.artikelbeschreibung, artikel.preis FROM artikel {sort_query} LIMIT 11 OFFSET %(page)s;", {"page": (page - 1) * 10, "sort": sort})
                articles = cur.fetchall()

        empty_template = loader.get_template("empty_site.html")
        template = loader.get_template("product/list.html")
        return HttpResponse(empty_template.render({"site": template.render({"search": search, "sort": sort, "articles": articles[:10], "prev_page": page - 1, "has_prev": page > 1, "next_page": page + 1, "has_next": len(articles) > 10}, request)}, request))
    return Http404()


def info(request: HttpRequest):
    if request.method == "GET":
        id_ = request.GET.get("id", "")
        try:
            id_number = int(id_)
            with db.open_connection() as con:
                con: db.connection
                with con.cursor() as cur:
                    cur: db.cursor

                    cur.execute("""SELECT * FROM artikel WHERE artikel.artikelid = %(id)s""", {"id": id_number})
                    info_ = cur.fetchall()

                    cur.execute("""SELECT farbe.farbid, farbe.farbbezeichnung, farbe.hexcode FROM artikel
                                    INNER JOIN artikelfarbe ON artikel.artikelid = artikelfarbe.artikelid
                                    INNER JOIN farbe ON artikelfarbe.farbid = farbe.farbid
                                    WHERE artikel.artikelid = %(id)s""", {"id": id_number})
                    colors = cur.fetchall()
                    cur.execute("""SELECT groeße.groeßenid, groeße.groeßenbezeichnung FROM artikel
                                    INNER JOIN artikelgroeße ON artikel.artikelid = artikelgroeße.artikelid
                                    INNER JOIN groeße ON artikelgroeße.groeßenid = groeße.groeßenid
                                    WHERE artikel.artikelid = %(id)s""", {"id": id_number})
                    sizes = cur.fetchall()
                    cur.execute("""SELECT material.materialid, material.materialbezeichnung FROM artikel
                                    INNER JOIN artikelmaterial ON artikel.artikelid = artikelmaterial.artikelid
                                    INNER JOIN material ON artikelmaterial.materialid = material.materialid
                                    WHERE artikel.artikelid = %(id)s""", {"id": id_number})
                    materials = cur.fetchall()
                    cur.execute("""SELECT motiv.motivid, motiv.motivbezeichnung FROM artikel
                                    INNER JOIN artikelmotiv ON artikel.artikelid = artikelmotiv.artikelid
                                    INNER JOIN motiv ON artikelmotiv.motivid = motiv.motivid
                                    WHERE artikel.artikelid = %(id)s""", {"id": id_number})
                    motivs = cur.fetchall()
                    cur.execute("""SELECT passform.passformid, passform.passformbezeichnung FROM artikel
                                    INNER JOIN artikelpassform ON artikel.artikelid = artikelpassform.artikelid
                                    INNER JOIN passform ON artikelpassform.passformid = passform.passformid
                                    WHERE artikel.artikelid = %(id)s""", {"id": id_number})
                    fits = cur.fetchall()
                    print(colors)
                    print(sizes)
                    print(materials)
                    print(motivs)
                    print(fits)
                    empty_template = loader.get_template("empty_site.html")
                    template = loader.get_template("product/info.html")
                    return HttpResponse(
                        empty_template.render(
                            {
                                "site":
                                    template.render(
                                        {
                                            "info": info_,
                                            "colors": colors,
                                            "sizes": sizes,
                                            "materials": materials,
                                            "motivs": motivs,
                                            "fits": fits
                                        },
                                        request
                                    )
                            },
                            request
                        )
                    )
                    return HttpResponse("")
        except ValueError:
            raise Http404()
    raise Http404()


def shopping_card(request: HttpRequest):
    if request.method == "POST":
        color = request.POST.get("color", "")
        size = request.POST.get("size", "")
        material = request.POST.get("material", "")
        motiv = request.POST.get("motiv", "")
        fit = request.POST.get("fit", "")
        amount = request.POST.get("amount", "")
        id_ = request.POST.get("id", "")
        try:
            color = int(color)
            size = int(size)
            material = int(material)
            motiv = int(motiv)
            fit = int(fit)
            amount = int(amount)
            id_ = int(id_)
        except ValueError:
            raise Http404()  # TODO
        print(f"id: {id_}, amount: {amount}, color: {color}, size: {size}, material: {material}, motiv: {motiv}, fit: {fit}")
    return HttpResponse("")

