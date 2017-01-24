#!/bin/bash

su - $PROJECT_APP_USER -c """
cd $PROJECT_APP_HOME
source $PROJECT_APP_VENV/bin/activate
cd project
pip install -r requirements.txt
pip install -r prod.pip
deactivate
"""
