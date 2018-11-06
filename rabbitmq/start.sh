#!/bin/bash
export RABBITMQ_CONFIG_PATH=${PWD}/config/rabbitmq-isolated.conf
export RABBITMQ_LISTEN_PORT=15672
export RABBITMQ_ADVERTISE_PORT=15672
export RABBITMQ_LISTEN_TWO_PORT=5672
export RABBITMQ_ADVERTISE_TWO_PORT=5672
export RABBITMQ_DATA_PATH=${PWD}/data
docker-compose -f docker-rabbitmq-compose.yml down
docker-compose -f docker-rabbitmq-compose.yml up -d 	#start create docker
