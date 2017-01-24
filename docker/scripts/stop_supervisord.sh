#!/bin/bash
# NOTE: This script must be ran as root or a superuser

PROJECT_VAR=$PROJECT_APP_HOME/project/docker/var
PIDFILE=$PROJECT_VAR/run/supervisord.pid

echo "--> Stopping supervisor service"
cat $PIDFILE | xargs kill -9
