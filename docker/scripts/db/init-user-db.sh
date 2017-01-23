#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER $PGDB_USER WITH PASSWORD '$PGDB_PASS';
    CREATE DATABASE $PGDB_NAME;
    GRANT ALL PRIVILEGES ON DATABASE $PGDB_NAME TO $PDBD_USER;
EOSQL
