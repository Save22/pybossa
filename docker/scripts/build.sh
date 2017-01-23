#!/bin/bash
# OS packages and libraries required to build the project
apt-get install -y \
    libpq-dev \
    libssl-dev \
    libffi-dev \
    libdbus-1-dev \
    libdbus-glib-1-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    liblcms2-dev \
    libpng12-dev \
    libjpeg-dev \
    libfreetype6-dev \
    swig \
    dbus \
    postgresql-server-dev-all \
    git-core \
    python-psycopg2 \
    python-virtualenv
