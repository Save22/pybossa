FROM ubuntu:14.04

# Build time env vars
ARG BUILD_DIR=/_build/
ARG BASE_PIP=/_build/requirements.txt

# Project env vars
# - A non-priv user named `pybossa` will be created with home dir at `/srv/pybossa`
# - A sudoer user named `happy` will be created for ssh login
# - a virtualenv called `venv` will be created
ENV VENV_NAME=venv
ENV PROJECT_APP_USER=pybossa
ENV PROJECT_APP_HOME=/srv/pybossa
ENV PROJECT_APP_DIR=/srv/pybossa/project
ENV PROJECT_APP_VENV=/srv/pybossa/venv

ENV PROJECT_SUDO_USER=happy
ENV PROJECT_SUDO_PASS=happy@1234

RUN mkdir -p $BUILD_DIR
WORKDIR $BUILD_DIR
ADD . $BUILD_DIR

# Install packages and build the environment
RUN apt-get update && apt-get install -y \
        build-essential \
        python-dev \
        htop \
        supervisor \
        openssh-server \
        && . $BUILD_DIR/docker/scripts/build.sh \
        && . $BUILD_DIR/docker/scripts/create_users.sh \
        && . $BUILD_DIR/docker/scripts/create_env.sh \
        && mkdir /var/run/sshd

# Clean up
RUN apt-get autoclean \
    && apt-get autoremove \
    && apt-get purge \
    && rm -Rf $BUILD_DIR

EXPOSE 22 5000

CMD ["/usr/sbin/sshd", "-D"]
