from django import template
from django.template import Node


register = template.Library()


@register.tag()
def print_stuff(parser, token):
    print(parser, token)
    return PrintStuffNode()


class PrintStuffNode(Node):
    def render(self, context):
        return str(context.get("csrf_token"))
