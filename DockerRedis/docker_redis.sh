#! /bin/bash
#wget -c http://download.redis.io/redis-stable/redis.conf
#chmod 755 docker_redis.sh
docker pull docker.io/redis
docker stop redis
docker rm redis


docker run -v /system/redis/data:/data -v /system/redis/redis.conf:/usr/local/etc/redis/redis.conf --name redis -p 6379:6379 --restart=always  -d redis redis-server /usr/local/etc/redis/redis.conf