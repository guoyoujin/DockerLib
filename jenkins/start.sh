#!/bin/bash
export JENKINS_HOME=${PWD}/home
docker-compose -f docker-jenkins-compose.yml down
docker-compose -f docker-jenkins-compose.yml up -d 	#start create docker
