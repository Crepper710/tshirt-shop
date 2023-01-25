import psycopg2 as _psycopg2
import config as _config


def open_connection():
    return _psycopg2.connect(
        host = _config.POSTGRES_ADDRESS,
        dbname = _config.POSTGRES_DB,
        user = _config.POSTGRES_USER,
        password = _config.POSTGRES_PASSWORD
    )
