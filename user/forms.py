from django.forms import Form, CharField


class SignUpForm(Form):
    firstname = CharField(label="First Name", max_length=128)
    lastname = CharField(label="Last Name", max_length=128)
    email = CharField(label="E-Mail", max_length=128)
    password = CharField(label="Password", max_length=128)
    password_confirm = CharField(label="Password Confirm", max_length=128)
    street = CharField(label="Street", max_length=128)
    house_number = CharField(label="House Number", max_length=128)
    zip_code = CharField(label="ZIP Code", max_length=128)
    town = CharField(label="Town", max_length=128)
