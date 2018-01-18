#!/bin/bash
export HOST_MONGO_DATA_PATH=${PWD}/data
docker-compose -f docker-mongo-compose.yml down
docker-compose -f docker-mongo-compose.yml up -d 	#start create docker
