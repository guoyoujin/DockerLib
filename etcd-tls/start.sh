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
		echo "install cfssl ......"
		curl -s -L -o /bin/cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
		echo "install cfssl success "
	}
	command -v cfssljson >/dev/null 2>&1 || { 
		echo "install cfssljson ......"
		curl -s -L -o /bin/cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
		echo "install cfssljson success "
	}
	command -v cfssl-certinfo >/dev/null 2>&1 || { 
		echo "install cfssl-certinfo ......"
		curl -s -L -o /bin/cfssl-certinfo https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
		echo "install cfssl-certinfo success "
	}
	chmod +x /bin/cfssl*
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
