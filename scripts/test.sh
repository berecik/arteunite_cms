#!/bin/sh

## wait for postgres
python wait_for_postgresql.py

python manage.py migrate
# python manage.py make_tickers

# python manage.py runserver_plus 0:8000
python manage.py test