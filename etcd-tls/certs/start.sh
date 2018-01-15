#!/bin/bash
# go get -u github.com/cloudflare/cfssl/cmd/cfssl
# go get -u github.com/cloudflare/cfssl/cmd/cfssljson

#生成 CA 证书
cfssl gencert -initca config/ca-csr.json | cfssljson -bare ca

#生成服务器端证书
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=config/ca-config.json -profile=server config/server.json | cfssljson -bare server

#生成对等证书
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=config/ca-config.json -profile=peer config/etcd1.json | cfssljson -bare etcd1
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=config/ca-config.json -profile=peer config/etcd2.json | cfssljson -bare etcd2
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=config/ca-config.json -profile=peer config/etcd3.json | cfssljson -bare etcd3

#生成客户端证书
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=config/ca-config.json -profile=client config/client.json | cfssljson -bare client

