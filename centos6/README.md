# Use
# 1.download file

```shell
wget https://github.com/guoyoujin/DockerLib/blob/master/centos6/CentOS-6-20140926_1219-docker.tar.xz\?raw\=true -O CentOS-6-20140926_1219-docker.tar.xz

wget -c https://raw.githubusercontent.com/guoyoujin/DockerLib/master/centos7/Dockerfile
```

# 2.run docker images
```shell
docker build -t centos6 .
```

`centos6`is run image name,You can customize it

