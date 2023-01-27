from django.forms import Form, CharField
from django.core.validators import RegexValidator


word_validator = RegexValidator(r"^(?:[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEFA-Za-z. \-]{0,128})$")
email_validator = RegexValidator(
    r"^(?:[\w-]+(?:\.[\w-]+)*)@(?:(?:[\w-]+\.)*\w[\w-]{0,66})\.(?:[a-z]{2,6}(?:\.[a-z]{2})?)$")
house_number_validator = RegexValidator(r"^[1-9][0-9]*[a-zA-Z]*$")


class SignUpForm(Form):
    firstname = CharField(label="First Name", max_length=128, validators = [word_validator])
    lastname = CharField(label="Last Name", max_length=128, validators = [word_validator])
    email = CharField(label="E-Mail", max_length=128, validators = [email_validator])
    password = CharField(label="Password", max_length=128, min_length = 8)
    password_confirm = CharField(label="Password Confirm", max_length=128, min_length = 8)
    street = CharField(label="Street", max_length=128, validators = [word_validator])
    house_number = CharField(label="House Number", max_length=128, validators = [house_number_validator])
    zip_code = CharField(label="ZIP Code", max_length=128)  # no regex possible (to different around the world)
    town = CharField(label="Town", max_length=128, validators = [word_validator])
