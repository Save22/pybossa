#!/bin/bash
# NOTE: This script must be ran as root or a superuser

PROJECT_VAR=$PROJECT_APP_HOME/project/docker/var

echo "--> Starting supervisor service"
/usr/bin/supervisord \
    --user $PROJECT_APP_USER \
    --directory $PROJECT_APP_HOME/project \
    --pidfile $PROJECT_VAR/run/supervisord.pid \
    --logfile $PROJECT_VAR/log/supervisord.log \
    --logfile_maxbytes 10000000 \
    --logfile_backups 2 \
    --loglevel info \
    --childlogdir $PROJECT_VAR/log \
    --minprocs 1
