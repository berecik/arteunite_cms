#!/usr/bin/env bash

echo "CREATE DATABASE $POSTGRES_USER;" | sudo -u postgres psql
echo "CREATE USER $POSTGRES_USER WITH PASSWORD '$POSTGRES_PASSWORD';" | sudo -u postgres psql
echo "ALTER ROLE $POSTGRES_USER SET client_encoding TO 'utf8';" | sudo -u postgres psql
echo "ALTER ROLE $POSTGRES_USER SET default_transaction_isolation TO 'read committed';" | sudo -u postgres psql
echo "ALTER ROLE $POSTGRES_USER SET timezone TO 'UTC';" | sudo -u postgres psql
echo "GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_USER TO $POSTGRES_USER;" | sudo -u postgres psql
echo "ALTER USER $POSTGRES_USER CREATEDB;" | sudo -u postgres psql
echo "ALTER ROLE $POSTGRES_USER SUPERUSER;" | sudo -u postgres psql
echo "CREATE DATABASE $POSTGRES_DB;" | sudo -u postgres psql
echo "GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;" | sudo -u postgres psql