#!/bin/bash
export HOST_MYSQL_DATA_PATH=${PWD}/data
export HOST_MYSQL_CONFIG_PATH=${PWD}/config
export HOST_MYSQL_BACK_DATA_PATH=${PWD}/back_data
export MYSQL_ROOT_PASSWORD=bobao2016
export MYSQL_USER=root
export MYSQL_DATABASE=neraex_development
#before docker remove contain doing Backup Data
docker exec mysql /usr/bin/mysqldump -u ${MYSQL_USER} --password=${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} > ${PWD}/back_data/backup.sql
docker-compose -f docker-mysql-compose.yml down
docker-compose -f docker-mysql-compose.yml up -d 	#start create docker
# becausse mysql running success times
sleep 100s 
#after docker start contain doing Restore
docker exec -i mysql /usr/bin/mysql -u ${MYSQL_USER} --password=${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE} < ${PWD}/back_data/backup.sql
