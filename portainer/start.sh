#!/bin/bash
export PORTAINER_DATA_PATH=${PWD}/data
export PORTAINER_ADVERTISE_PORT=9000
export PORTAINER_LISTEN_PORT=9000
docker-compose -f docker-portainer-compose.yml down
docker-compose -f docker-portainer-compose.yml up -d 	#start create docker
