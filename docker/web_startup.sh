#!/bin/bash

cd $PROJECT_APP_DIR
./docker/scripts/run_deploy.sh
./docker/scripts/run_sshd.sh
