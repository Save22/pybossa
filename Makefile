SHELL := /bin/bash

.PHONY:
	init_env
	create_env
	create_user

init_env:
	make create_user
	make create_env

create_user:
	source scripts/create_users.sh

create_env:
	source scripts/create_env.sh
