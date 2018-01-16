#!/bin/bash
sysOS=`uname -s`
if [ $sysOS == "Darwin" ];then
	echo "I'm MacOS"
	command -v cfssl >/dev/null 2>&1 || { 
		echo " brew install cfssl ........."
		brew install cfssl
	}
elif [ $sysOS == "Linux" ];then
	echo "I'm Linux"
	command -v cfssl >/dev/null 2>&1 || { 
		curl -s -L -o /bin/cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
		chmod +x /usr/bin/cfssl
	}
	command -v cfssljson >/dev/null 2>&1 || { 
		curl -s -L -o /bin/cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
		chmod +x /bin/cfssljson
	}
	command -v cfssl-certinfo >/dev/null 2>&1 || { 
		curl -s -L -o /bin/cfssl-certinfo https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
		chmod +x /bin/cfssl-certinfo
	}
else
	echo "Other OS: $sysOS"
fi
export HOST_ETCD_CERTS_PATH=${PWD}/certs
export HOST_ETCD_DATA_PATH=${PWD}/data 
chmod +x certs/start.sh
cd certs
./start.sh
cd ..
docker-compose -f docker-etcd-compose.yml down
docker-compose -f docker-etcd-compose.yml up -d 	#start create docker
