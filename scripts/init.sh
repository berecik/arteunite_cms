#!/bin/sh

DONE=/usr/src/app/done
if [[ ! -f $DONE ]];
then
    # wait for postgres
    python wait_for_postgresql.py

    python manage.py migrate
    python manage.py make_tickers
    python manage.py clean_tickers
    python manage.py calculate_tickers

    touch $DONE # to unblock cron task
fi