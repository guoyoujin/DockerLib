#!/bin/bash
export HOST_MYSQL_DATA_PATH=${PWD}/data
export HOST_MYSQL_CONFIG_PATH=${PWD}/config
docker-compose -f docker-mysql-compose.yml down
docker-compose -f docker-mysql-compose.yml up -d 	#start create docker
