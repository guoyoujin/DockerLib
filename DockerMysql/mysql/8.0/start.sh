#!/bin/bash

docker build -t mysql .
cd docker-compose-master
./start.sh
cd ..
cd docker-compose-follow
./start.sh
cd ..
cd docker-compose-follow2
./start.sh

