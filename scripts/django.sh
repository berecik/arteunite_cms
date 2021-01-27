#!/bin/sh

## wait for postgres
python utils/wait_for_postgresql.py

python manage.py migrate
# python manage.py make_tickers

# python manage.py runserver_plus 0:8000
gunicorn -w 16 -b 0:8000 -t 360 python_indicators.wsgi