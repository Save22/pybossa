#!/bin/bash

echo "-> Creating virtualenv and installing requirements"

echo $BASE_PIP
su - $PROJECT_APP_USER -c """
cd $PROJECT_APP_HOME
virtualenv $VENV_NAME
source $PROJECT_APP_VENV/bin/activate
pip install urllib3[secure]
pip install -U setuptools
pip install -U pip
pip install -r $BASE_PIP
pip install -e $BUILD_DIR
pip install -U uwsgi
deactivate
"""
