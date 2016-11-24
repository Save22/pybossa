#!/bin/bash
psql -U postgres -h pybossa_postgres < ./scripts/init.sql
sudo service redis-server stop
sudo rm /etc/init.d/redis-server

sudo cp /srv/pybossa/project/contrib/supervisor/redis-server.conf /etc/supervisor/conf.d/
sudo cp /srv/pybossa/project/contrib/supervisor/redis-sentinel.conf /etc/supervisor/conf.d/
sudo cp /srv/pybossa/project/contrib/redis-supervisor/redis.conf /etc/redis/
sudo cp /srv/pybossa/project/contrib/redis-supervisor/sentinel.conf /etc/redis/
sudo chown redis:redis /etc/redis/redis.conf
sudo chown redis:redis /etc/redis/sentinel.conf

sudo cp /srv/pybossa/project/scripts/supervisor/rq-scheduler.conf.template /etc/supervisor/conf.d/rq-scheduler.conf
sudo cp /srv/pybossa/project/scripts/supervisor/rq-worker.conf.template /etc/supervisor/conf.d/rq-worker.conf

sudo cp /srv/pybossa/project/scripts/supervisor/pybossa.conf.template /etc/supervisor/conf.d/pybossa.conf

sudo service supervisor restart && supervisorctl restart rq-scheduler && \
    supervisorctl restart rq-worker && supervisorctl restart pybossa

/usr/sbin/sshd -D
