import secrets
from os import environ

ALG = "HS256"
SECRET_KEY = secrets.token_hex(32)
FLAG = environ.get("FLAG")