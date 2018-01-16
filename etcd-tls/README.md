相关文档
http://www.tianfeiyu.com/?p=2702


https://github.com/hexfusion/etcd-compose-examples

# etcd3集群

1.start.sh变为可执行文件
```shell
chmod +x start.sh
```

2.运行脚本
```shell
./start.sh
```

3.  测试集群是否正常
```
curl --cacert ca.pem --cert client.pem --key client-key.pem https://127.0.0.1:23791/health


输出结果：
{"health": "true"}
```

4.测试集群成员
```
curl --cacert ca.pem --cert client.pem --key client-key.pem https://127.0.0.1:23791/v2/members


{"members":[{"id":"982631eea5273d1f","name":"node2","peerURLs":["https://etcd2:2380"],"clientURLs":["https://etcd2:2379"]},{"id":"b2b71680adc3e1e2","name":"node1","peerURLs":["https://etcd1:2380"],"clientURLs":["https://etcd1:2379"]},{"id":"f9fbe2b54c503cab","name":"node3","peerURLs":["https://etcd3:2380"],"clientURLs":["https://etcd3:2379"]}]}
```

5.测试集群keys
```
curl --cacert ca.pem --cert client.pem --key client-key.pem https://127.0.0.1:23791/v2/keys


{"action":"get","node":{"dir":true}}
```