from jinja2 import FileSystemLoader, Environment


_j2_loader = FileSystemLoader(searchpath = "./app/")
empty_site = Environment(loader = _j2_loader).get_template("empty_site.j2")
_j2_loader = FileSystemLoader(searchpath = "./app/sites/")
j2_environment = Environment(loader = _j2_loader)
