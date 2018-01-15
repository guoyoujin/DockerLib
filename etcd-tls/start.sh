#!/bin/bash
# brew install cfssl
# sudo curl -s -L -o /bin/cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
# sudo curl -s -L -o /bin/cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
# sudo curl -s -L -o /bin/cfssl-certinfo https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
# sudo chmod +x /bin/cfssl*
# sudo cfssl -h
# sudo cp -R certs $HOST_DATA_PATH
# sudo chown -R etcd:etcd $HOST_DATA_PATH/certs/
# sudo chmod 600 $HOST_DATA_PATH/certs/*-key.pem
export HOST_ETCD_CERTS_PATH=${PWD}/certs
export HOST_ETCD_DATA_PATH=${PWD}/data 
sudo chmod +x certs/start.sh
cd certs
./start.sh
cd ..
docker-compose -f docker-etcd-compose.yml down
docker-compose -f docker-etcd-compose.yml up -d 	#start create docker
