import json
import uuid

from django.http import HttpRequest
from django.shortcuts import Http404, HttpResponse, redirect
from django.template import loader

import db
import base64

import token_util


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
                cur.execute(
                    f"SELECT artikel.artikelid, artikel.artikelbezeichnung, artikel.artikelbeschreibung, "
                    f"artikel.preis FROM artikel {sort_query} LIMIT 11 OFFSET %(page)s;",
                    {"page": (page - 1) * 10, "sort": sort}
                )
                articles = cur.fetchall()

        empty_template = loader.get_template("empty_site.html")
        template = loader.get_template("product/list.html")
        return HttpResponse(
            empty_template.render(
                {
                    "site": template.render(
                        {
                            "search": search,
                            "sort": sort,
                            "articles": articles[:10],
                            "prev_page": page - 1,
                            "has_prev": page > 1,
                            "next_page": page + 1,
                            "has_next": len(articles) > 10
                        },
                        request
                    )
                },
                request
            )
        )
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

                    cur.execute(
                        """SELECT farbe.farbid, farbe.farbbezeichnung, farbe.hexcode FROM artikel
                        INNER JOIN artikelfarbe ON artikel.artikelid = artikelfarbe.artikelid
                        INNER JOIN farbe ON artikelfarbe.farbid = farbe.farbid
                        WHERE artikel.artikelid = %(id)s""", {"id": id_number}
                    )
                    colors = cur.fetchall()
                    cur.execute(
                        """SELECT groeße.groeßenid, groeße.groeßenbezeichnung FROM artikel
                        INNER JOIN artikelgroeße ON artikel.artikelid = artikelgroeße.artikelid
                        INNER JOIN groeße ON artikelgroeße.groeßenid = groeße.groeßenid
                        WHERE artikel.artikelid = %(id)s""", {"id": id_number}
                    )
                    sizes = cur.fetchall()
                    cur.execute(
                        """SELECT material.materialid, material.materialbezeichnung FROM artikel
                        INNER JOIN artikelmaterial ON artikel.artikelid = artikelmaterial.artikelid
                        INNER JOIN material ON artikelmaterial.materialid = material.materialid
                        WHERE artikel.artikelid = %(id)s""", {"id": id_number}
                    )
                    materials = cur.fetchall()
                    cur.execute(
                        """SELECT motiv.motivid, motiv.motivbezeichnung FROM artikel
                        INNER JOIN artikelmotiv ON artikel.artikelid = artikelmotiv.artikelid
                        INNER JOIN motiv ON artikelmotiv.motivid = motiv.motivid
                        WHERE artikel.artikelid = %(id)s""", {"id": id_number}
                    )
                    motivs = cur.fetchall()
                    cur.execute(
                        """SELECT passform.passformid, passform.passformbezeichnung FROM artikel
                        INNER JOIN artikelpassform ON artikel.artikelid = artikelpassform.artikelid
                        INNER JOIN passform ON artikelpassform.passformid = passform.passformid
                        WHERE artikel.artikelid = %(id)s""", {"id": id_number}
                    )
                    fits = cur.fetchall()

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
        except ValueError:
            raise Http404()
    raise Http404()


def shopping_cart(request: HttpRequest):
    cart = request.COOKIES.get("shopping_cart", "[]")
    try:
        cart = json.loads(cart)
    except AttributeError:
        cart = {}
    if type(cart) != dict:
        cart = {}

    if request.method == "POST":
        action = request.POST.get("action", "")
        if action == "add":
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
                cart[str(uuid.uuid4())] = {
                    "id": id_,
                    "amount": amount,
                    "color": color,
                    "size": size,
                    "material": material,
                    "motiv": motiv,
                    "fit": fit
                }
            except ValueError:
                pass

        elif action == "rem":
            uuid_ = request.POST.get("uuid", "")
            if uuid_ in cart:
                del cart[uuid_]

    cart_queried = []
    with db.open_connection() as con:
        con: db.connection
        with con.cursor() as cur:
            cur: db.cursor

            cur.execute(
                """SELECT farbe.farbid, farbe.farbbezeichnung, farbe.hexcode FROM artikel
                INNER JOIN artikelfarbe ON artikel.artikelid = artikelfarbe.artikelid
                INNER JOIN farbe ON artikelfarbe.farbid = farbe.farbid"""
            )
            temp = cur.fetchall()
            colors = {}
            for entry in temp:
                colors[entry[0]] = entry[1:3]

            cur.execute(
                """SELECT groeße.groeßenid, groeße.groeßenbezeichnung FROM artikel
                INNER JOIN artikelgroeße ON artikel.artikelid = artikelgroeße.artikelid
                INNER JOIN groeße ON artikelgroeße.groeßenid = groeße.groeßenid"""
            )
            temp = cur.fetchall()
            sizes = {}
            for entry in temp:
                sizes[entry[0]] = entry[1]

            cur.execute(
                """SELECT material.materialid, material.materialbezeichnung FROM artikel
                INNER JOIN artikelmaterial ON artikel.artikelid = artikelmaterial.artikelid
                INNER JOIN material ON artikelmaterial.materialid = material.materialid"""
            )
            temp = cur.fetchall()
            materials = {}
            for entry in temp:
                materials[entry[0]] = entry[1]

            cur.execute(
                """SELECT motiv.motivid, motiv.motivbezeichnung FROM artikel
                INNER JOIN artikelmotiv ON artikel.artikelid = artikelmotiv.artikelid
                INNER JOIN motiv ON artikelmotiv.motivid = motiv.motivid"""
            )
            temp = cur.fetchall()
            motivs = {}
            for entry in temp:
                motivs[entry[0]] = entry[1]

            cur.execute(
                """SELECT passform.passformid, passform.passformbezeichnung FROM artikel
                INNER JOIN artikelpassform ON artikel.artikelid = artikelpassform.artikelid
                INNER JOIN passform ON artikelpassform.passformid = passform.passformid"""
            )
            temp = cur.fetchall()
            fits = {}
            for entry in temp:
                fits[entry[0]] = entry[1]

            for uuid_ in cart:

                element = cart[uuid_]
                element_queried = {}

                id_ = element.get("id", -1)
                color = element.get("color", -1)
                size = element.get("size", -1)
                material = element.get("material", -1)
                motiv = element.get("motiv", -1)
                fit = element.get("fit", -1)
                amount = element.get("amount", -1)

                cur.execute("""SELECT * FROM artikel WHERE artikel.artikelid = %(id)s""", {"id": id_})
                info_ = cur.fetchone()
                element_queried["uuid"] = uuid_
                element_queried["amount"] = amount

                if info_ is None:
                    continue
                else:
                    element_queried["info"] = info_

                if type(color) == int and color in colors:
                    element_queried["color"] = colors[color]
                if type(size) == int and size in sizes:
                    element_queried["size"] = sizes[size]
                if type(material) == int and material in materials:
                    element_queried["material"] = materials[material]
                if type(motiv) == int and motiv in motivs:
                    element_queried["motiv"] = motivs[motiv]
                if type(fit) == int and fit in fits:
                    element_queried["fit"] = fits[fit]

                cart_queried.append(element_queried)

    empty_template = loader.get_template("empty_site.html")
    template = loader.get_template("product/shopping_cart.html")
    cart_json = json.dumps(cart)
    response = HttpResponse(
        empty_template.render(
            {
                "site": template.render(
                    {
                        "cart": cart_queried,
                        "cart_json": base64.urlsafe_b64encode(cart_json.encode("ascii")).decode("ascii"),
                        "logged_in": "token" in request.COOKIES
                    },
                    request
                )
            },
            request
        )
    )
    response.set_cookie("shopping_cart", cart_json)
    return response


def check_out(request: HttpRequest):
    response = redirect("/")

    if request.method == "POST" and "token" in request.COOKIES:
        cart_b64 = request.POST.get("cart", "")
        cart_json = base64.urlsafe_b64decode(cart_b64).decode("ascii")
        cart = json.loads(cart_json)

        user_id = token_util.get_user_from_token(request.COOKIES.get("token", ""))

        if user_id is not None:
            with db.open_connection() as con:
                con: db.connection
                with con.cursor() as cur:
                    cur: db.cursor

                    successfully_added = 0

                    cur.execute("""
                    INSERT INTO bestellung (kundenid) VALUES (%(user_id)s) RETURNING bestellid
                    """, {
                        "user_id": user_id
                    })

                    order_id = cur.fetchone()[0]

                    for key in cart:
                        entry = cart[key]

                        id_ = entry.get("id", -1)
                        color = entry.get("color", -1)
                        size = entry.get("size", -1)
                        material = entry.get("material", -1)
                        motiv = entry.get("motiv", -1)
                        fit = entry.get("fit", -1)
                        amount = entry.get("amount", -1)

                        values = {
                            "order_id": order_id,
                            "id": id_,
                            "amount": amount,
                            "color": None,
                            "size": None,
                            "material": None,
                            "motiv": None,
                            "fit": None
                        }

                        if id_ < 0 or amount < 0 or amount > 20:
                            continue

                        if color > 0:
                            cur.execute("""
                            SELECT COUNT(*) FROM artikelfarbe WHERE artikelid = %(id)s AND farbid = %(color)s
                            """, {
                                "id": id_,
                                "color": color
                            })
                            if cur.fetchone()[0] > 0:
                                values["color"] = color

                        if size > 0:
                            cur.execute("""
                            SELECT COUNT(*) FROM artikelgroeße WHERE artikelid = %(id)s AND groeßenid = %(size)s
                            """, {
                                "id": id_,
                                "size": size
                            })
                            if cur.fetchone()[0] > 0:
                                values["size"] = size

                        if material > 0:
                            cur.execute("""
                            SELECT COUNT(*) FROM artikelmaterial WHERE artikelid = %(id)s AND materialid = %(material)s
                            """, {
                                "id": id_,
                                "material": material
                            })
                            if cur.fetchone()[0] > 0:
                                values["material"] = material

                        if motiv > 0:
                            cur.execute("""
                            SELECT COUNT(*) FROM artikelmotiv WHERE artikelid = %(id)s AND motivid = %(motiv)s
                            """, {
                                "id": id_,
                                "motiv": motiv
                            })
                            if cur.fetchone()[0] > 0:
                                values["motiv"] = motiv

                        if fit > 0:
                            cur.execute("""
                            SELECT COUNT(*) FROM artikelpassform WHERE artikelid = %(id)s AND passformid = %(fit)s
                            """, {
                                "id": id_,
                                "fit": fit
                            })
                            if cur.fetchone()[0] > 0:
                                values["fit"] = fit

                        cur.execute("""
                        INSERT INTO bestellungartikel (bestellid, artikelid, passformid, groeßenid, motivid, farbid,
                        materialid, anzahl)
                        VALUES (%(order_id)s, %(id)s, %(fit)s, %(size)s, %(motiv)s, %(color)s, %(material)s, %(amount)s)
                        """, values)

                        successfully_added += 1

                    if successfully_added <= 0:
                        con.rollback()

            response.delete_cookie("shopping_cart")

    return response
