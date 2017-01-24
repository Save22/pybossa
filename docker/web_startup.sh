#!/bin/bash

# Run deployment script
cd $PROJECT_APP_HOME/project \
    && ./docker/scripts/run_deploy.sh

# SSH service should be the last to run
cd $PROJECT_APP_HOME/project \
    && . docker/scripts/run_sshd.sh
