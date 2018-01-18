#!/bin/bash
export HOST_REDIS_DATA_PATH=${PWD}/data
docker-compose -f docker-redis-compose.yml down
docker-compose -f docker-redis-compose.yml up -d 	#start create docker
