# etcd3集群

1.start.sh变为可执行文件
```shell
chmod +x start.sh
```

2.运行脚本
```shell
./start.sh
```

3. 测试集群
```
curl http://127.0.0.1:23791/v2/members


输出结果：
{"members":[{"id":"4d1b6b8f111ef2d2","name":"node2","peerURLs":["http://etcd2:2380"],"clientURLs":["http://etcd2:2379"]},{"id":"d60d694d4699f02b","name":"node1","peerURLs":["http://etcd1:2380"],"clientURLs":["http://etcd1:2379"]},{"id":"e55d8454b0a67020","name":"node3","peerURLs":["http://etcd3:2380"],"clientURLs":["http://etcd3:2379"]}]}
```

4.输出结果
```
{"members":[{"id":"4d1b6b8f111ef2d2","name":"node2","peerURLs":["http://etcd2:2380"],"clientURLs":["http://etcd2:2379"]},{"id":"d60d694d4699f02b","name":"node1","peerURLs":["http://etcd1:2380"],"clientURLs":["http://etcd1:2379"]},{"id":"e55d8454b0a67020","name":"node3","peerURLs":["http://etcd3:2380"],"clientURLs":["http://etcd3:2379"]}]}
```