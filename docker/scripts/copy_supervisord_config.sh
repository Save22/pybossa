#!/bin/bash
# NOTE: This script must be ran as root or a superuser

CONFIG=$PROJECT_APP_HOME/project/docker/supervisor.conf.d

echo "--> Updating supervisord configuration"
cp -uvf $CONFIG/*.conf /etc/supervisor/conf.d/
