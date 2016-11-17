# make docker node images

git version 1.8.3.1
Python 2.7.5
gcc version 4.8.5 20150623 (Red Hat 4.8.5-4) (GCC)
node v5.10.1
npm 3.8.3

### 1.download centos7
```shell
wget -c https://raw.githubusercontent.com/guoyoujin/DockerLib/master/centos7/Dockerfile

wget https://github.com/guoyoujin/DockerLib/blob/master/centos7/CentOS-7-20140926_1219-docker.tar.xz?raw=true -O CentOS-7-20140926_1219-docker.tar.xz
```

###  2.build centos7 images
```shell
docker build -t centos7 .
```

### 3.new docker images docker_node5.10.1
```shell
docker run --name node5.10.1 -i -t centos7 bash
```

上面重点是－v这个命令，翻译过来就是 docker run 了一个名叫docker_node5.10.1的镜像，镜像源为centos7
目录映射是从宿主机的/root/docker_node5.10.1文件影射到了镜像里面的/home目录下.

### 4. install wget
```shell
apt-get update
apt-get install wget
```

### 5.install make
```shell
apt-get install make
```

### 6.install tar
```shell
apt-get install tar
```

### 7.install gcc gcc-c++
```shell
apt-get install gcc gcc-c++
```

### 8.install git
```shell
apt-get install git
```

### 9. download node file
```shell
cd /home && wget -c https://github.com/guoyoujin/DockerLib/blob/master/node/node-v5.10.1.tar.gz?raw=true -O node-v5.10.1.tar.gz
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