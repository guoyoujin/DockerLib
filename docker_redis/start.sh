#!/bin/bash
export HOST_REDIS_BACK_DATA_PATH=${PWD}/back_data
export HOST_REDIS_DATA_PATH=${PWD}/data
export REDIS_PASSWORD=
export HOST_REDIS_CONFIG_PATH=${PWD}/config/redis.conf
export REDIS_LISTEN_PORT=6379
export REDIS_ADVERTISE_PORT=6379
docker-compose -f docker-redis-compose.yml down
docker-compose -f docker-redis-compose.yml up -d 	#start create docker
#docker exec -it redis redis-cli
