from django.core.handlers.wsgi import WSGIRequest
from django.template.library import Library
from django.template.base import Node

import db
import token_util


register = Library()


@register.tag()
def session_buttons(parser, token):
    return SessionButtonsNode()


class SessionButtonsNode(Node):
    def render(self, context):
        not_logged_in_buttons = """
            <div class="navbar-item">
                <div class="buttons">
                    <a class="button" href="/user/signup/">Sign up</a>
                    <a class="button is-primary" href="/user/login/">Log in</a>
                </div>
            </div>
        """

        request = context.get("request")
        request: WSGIRequest

        token = request.COOKIES.get("token")

        if token is None:
            return not_logged_in_buttons

        user_id = token_util.get_user_from_token(token)
        if user_id is None:
            return not_logged_in_buttons

        with db.open_connection() as con:
            with con.cursor() as cur:
                cur: db.cursor

                cur.execute(
                    """
                        SELECT vorname FROM benutzer WHERE benutzerid = %(id)s
                    """, {
                        "id": user_id
                    }
                )

                temp = cur.fetchall()

                if len(temp) > 0:
                    user_name = temp[0]

        return f"""
            <div class="navbar-item">Willkommen: {user_name[0]}</div>
            <div class="navbar-item">
                <div class="buttons">
                    <a class="button" href="/user/profile/">Zum profil</a>
                    <a class="button is-primary" href="/user/logout/">Log out</a>
                </div>
            </div>
        """

