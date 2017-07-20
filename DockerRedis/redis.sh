# redis.sh
#!/bin/sh
slavenum=1;
if [ "$1" != "" ]; then
	if [ ${1} == "clear" ]; then
		OLDREDIS=`docker container ls|grep "redis-"|awk -F " " '{print $1}'`
		for v in ${OLDREDIS}
		do
			docker rm -f ${v}	
		done
		echo "redis clear success"
		exit 1
	fi
    slavenum=${1}
fi
slaveport=16379;
if [ "$2" != "" ]; then
    slaveport=${2}
fi

if  [ -f "/tmp/redis.conf" ]; then
	rm /tmp/redis.conf
fi
wget -c http://download.redis.io/redis-stable/redis.conf -O /tmp/redis.conf

if [ $? != 0 ]; then 
	echo "wget redis.conf failed"
	exit 1
fi
sed -i "" "s/# slaveof <masterip> <masterport>/slaveof redis-master 6379/g" \
/tmp/redis.conf
sed -i "" "s/bind 127.0.0.1/#bind 127.0.0.1/g" \
/tmp/redis.conf
sed -i "" "s/protected-mode yes/#protected-mode yes/g" \
/tmp/redis.conf

docker pull redis
if [ $? != 0 ]; then 
	echo "docker pull redis failed"
	exit 1
fi

docker run -h redis-master --name redis-master -p 6379:6379 -d redis
if [ $? != 0 ]; then 
	echo "redis-master run failed"
	exit 1
else
	echo "redis-master run success"
fi

for ((i==0;i<${slavenum};i++))
do
	echo "redis-slave${i} port:"${slaveport}
	docker run --link redis-master:redis-master -h redis-slave${i} --name redis-slave${i} \
	-p  ${slaveport}:6379 -v /tmp/redis.conf:/usr/local/etc/redis.conf \
	-d redis redis-server /usr/local/etc/redis.conf
	if [ $? != 0 ]; then 
		echo "redis-slave${i} run failed"
		continue
	else
		echo "redis-slave${i} run success"
	fi
	let slaveport++
done