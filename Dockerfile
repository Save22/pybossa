FROM ubuntu:14.04

ARG BUILD_DIR=/_build/
ARG BASE_PIP=/_build/requirements.txt

RUN mkdir -p $BUILD_DIR
WORKDIR $BUILD_DIR
ADD . $BUILD_DIR
RUN chmod 777 $BUILD_DIR

ADD ./contrib/sentinel.conf /etc/redis/sentinel_pybossa.conf
ADD ./scripts/startup.sh /etc/redis/startup.sh
ADD ./scripts/init.sql /etc/redis/init.sql
RUN chmod +x /etc/redis/startup.sh


ENV APP_ENV=env
ENV VENV_NAME=env
ENV PROJECT_APP_USER=pybossa
ENV PROJECT_APP_HOME=/srv/pybossa
ENV PROJECT_APP_DIR=/srv/pybossa/project
ENV PROJECT_APP_VENV=/srv/pybossa/env
ENV PROJECT_SUDO_USER=edge
ENV PROJECT_SUDO_PASS=3dg3@1234


RUN apt-get update && apt-get install -y \
        python-dev \
        build-essential \
        libjpeg-dev \
        libssl-dev \
        swig \
        libffi-dev \
        dbus \
        libdbus-1-dev \
        libdbus-glib-1-dev \
        python-virtualenv \
        htop \
        tmux \
        git-core \
        libpq-dev \
        redis-server \
        postgresql \
        postgresql-server-dev-all \
        libpq-dev \
        python-psycopg2 \
        supervisor \
        openssh-server && \
        mkdir /var/run/sshd && \
        make init_env


# Clean up
RUN apt-get autoclean \
    && apt-get autoremove \
    && apt-get purge \
    && rm -Rf $BUILD_DIR

EXPOSE 22 5000 6379

CMD ["/usr/sbin/sshd", "-D"]
