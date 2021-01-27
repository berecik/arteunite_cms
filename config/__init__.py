import os

from utils import Singleton, bool_value


DEFAULT_SETTINGS = {
    "POSTGRES_DB": ("arteunite_wagtail", None),
    "POSTGRES_USER": ("admin", None),
    "POSTGRES_PASSWORD": ("password", None),
    "POSTGRES_HOST": ("localhost", None),
    "POSTGRES_PORT": (5432, int),
    "PORT": (8082, int),
    "CELERY_BROKER_URL": ("amqp://localhost", None),
    "DEBUG": (1, bool_value),
    "SECRET_KEY": ("j23nadaje", None),
    "TZ": ("Europe/Warsaw", None),
    "LANGUAGE_CODE": ("pl", None)
}

@Singleton
class Config(object):
    def __init__(self):
        for name, default_value in DEFAULT_SETTINGS.items():
            default, fun = default_value
            value = os.environ.get(name, default)
            if fun is not None:
                value = fun(value)
            setattr(self, name, value)


config = Config()
