#!/bin/sh
set -e

#psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
#	CREATE USER weirdjs;
#	CREATE DATABASE jsexercise;
#	GRANT ALL PRIVILEGES ON DATABASE jsexercise TO weirdjs;
#EOSQL
#/etc/init.d/postgresql start

until nc -z postgres 5432; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

node ./app.js
