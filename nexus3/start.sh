#!/bin/bash
export NUXUS_WORK=${PWD}/work
export NUXUS_DATA=${PWD}/data
export NUXUS_ADVERTISE_PORT=8081
export NUXUS_LISTEN_PORT=8081
mkdir ${PWD}/work
chown -R 200 ${PWD}/work
mkdir ${PWD}/data
chown -R 200 ${PWD}/data
docker-compose -f docker-nexus3-compose.yml down
docker-compose -f docker-nexus3-compose.yml up -d 	#start create docker
