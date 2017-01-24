#!/bin/bash
# NOTE: This script must be ran as root or a superuser

echo "--> Starting app deployment steps"

echo "--> Installing project requirements"
cd $PROJECT_APP_HOME/project \
    && . docker/scripts/install_requirements.sh

echo "--> Running migrations"
cd $PROJECT_APP_HOME/project \
    && . docker/scripts/run_migrations.sh

echo "--> Starting services"

# Supervisor
cd $PROJECT_APP_HOME/project \
    && . docker/scripts/run_supervisord.sh &
