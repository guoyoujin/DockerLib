# make docker node images

git version 1.8.3.1
Python 2.7.5
gcc version 4.8.5 20150623 (Red Hat 4.8.5-4) (GCC)
node v5.10.1
npm 3.8.3

### 1.new file
```shell
mkdir docker_node5.10.1 && cd docker_node5.10.1
```

### 2.download node & centos7
```shell
wget https://github.com/guoyoujin/DockerLib/blob/master/centos7/CentOS-7-20140926_1219-docker.tar.xz?raw=true -O CentOS-7-20140926_1219-docker.tar.xz

wget -c https://github.com/guoyoujin/DockerLib/blob/master/node/node-v5.10.1.tar.gz?raw=true -O node-v5.10.1.tar.gz
```

###  3.build centos7 images
```shell
docker build -t centos7 .
```

### 4.new docker images docker_node5.10.1
```shell
docker run --name docker_node5.10.1 -v /root/docker_node5.10.1/:/home -i -t centos7 bash
```

上面重点是－v这个命令，翻译过来就是 docker run 了一个名叫docker_node5.10.1的镜像，镜像源为centos7
目录映射是从宿主机的/root/docker_node5.10.1文件影射到了镜像里面的/home目录下.

### 5. install wget
```shell
yum update
yum install wget
```

### 6.install make
```shell
yum install make
```

### 7.install tar
```shell
yum install tar
```

### 8.install gcc gcc-c++
```shell
yum install gcc gcc-c++
```

### 9.install git
```shell
yum install git
```

### 10.tar file
```shell
cd /home && tar xzvf node-v* && cd node-v*
```

### 11.compiling & install
```shell
./configure
make
make install
```

### 12.Check the version
```
bash-4.2# node -v
v5.10.1
bash-4.2# npm -v
3.8.3
bash-4.2# 
```

### 13.install
```shell
npm install -g node-gyp

npm install -g pm2

```
<a href="https://github.com/nodejs/node-gyp">node-gyp</a>
<a href="https://github.com/Unitech/pm2">pm2</a>

### 14.commit images
```shell
exit ###先退出镜像

docker commit -m "node 5.10.1" docker_node5.10.1 docker_node5.10.1 
```
第一个docker_node5.10.1是制作的镜像名，第二个是生成的新的镜像名字

### 15.export images
```shell
sudo docker save -o 20161114_docker_node5.10.1.tar docker_node5.10.1
```
第一个20161114_docker_node5.10.1.tar是导出的文件名，docker_node5.10.1镜像名字