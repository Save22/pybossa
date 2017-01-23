#!/bin/bash

echo "-> Creating virtualenv and installing base requirements"
su - $PROJECT_APP_USER -c """
cd $PROJECT_APP_HOME
virtualenv $VENV_NAME
source $PROJECT_APP_VENV/bin/activate
cd $BUILD_DIR
pip install -r $BASE_PIP
deactivate
"""
