from fastapi import FastAPI, Response
from fastapi.responses import HTMLResponse
from jinja2 import Template

app = FastAPI()


template = """
<html>
  <head>
  </head>
  <body>
    <h1>Test:</h1>
    entries:
    <ul>
    {% for entry in the_list %}
      <li>{{entry}}</li>
    {% endfor %}
    </ul>
    <code>Var: {{var}}</code>
    <br>
    <kbd>Opened: {{opened}}</kbd>
  </body>
</html>
"""

j2_template = Template(template)

opened = 0


@app.get("/", response_class = HTMLResponse)
async def root():
    for i in range(3):
        print('hello')
    print('bye')
    global opened
    opened += 1
    return j2_template.render(
            {
                'the_list': [
                    'so',
                    'much',
                    'stuff',
                    'in',
                    'here'
                ],
                'var': 'so variable',
                'opened': opened
            }
        )


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}
