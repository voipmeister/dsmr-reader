""" Tests with PostgreSQL backend. """
from dsmrreader.config.test import *


# Use for TESTING only: ALTER USER dsmrreader CREATEDB;
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',  # Sub configs should set this.
        'NAME': 'dsmrreader',  # Will be adjusted to 'test_*' by Django.
        'USER': 'dsmrreader',
        'PASSWORD': 'dsmrreader',
        'HOST': '127.0.0.1',
    }
}
