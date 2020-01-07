#! /bin/bash
#chmod docker_memcached.sh
docker pull docker.io/memcached
docker run --name memcached -d -p 11211:11211 --restart=always docker.io/memcached memcached -m 100