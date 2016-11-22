#我的blog涉及到许多插件如下：
centos7 
nodejs  v5.10.1
ruby    2.3.0 
rvm     1.27.0
npm     3.8.3
sass    3.4.22
gem     2.6.7
git     1.8.3.1
bower   1.8.0
gulp    3.9.1
mongo   
redis   
cnpm    
gcc     4.8.5
python  2.7.5
pm2     2.1.5

# 1.下载制作centos7镜像需要用到的资源

```shell
wget https://github.com/guoyoujin/DockerLib/blob/master/centos7/CentOS-7-20140926_1219-docker.tar.xz?raw=true -O CentOS-7-20140926_1219-docker.tar.xz

wget -c https://raw.githubusercontent.com/guoyoujin/DockerLib/master/centos7/Dockerfile
```

# 2.制作一个centos7镜像
```shell
docker build -t centos7 .
```

### 3. 安装依赖插件 wget && make && tar && gcc gcc-c++ && git && vim
```shell
yum update
yum install wget
yum install make
yum install tar
yum install gcc gcc-c++
yum install git
yum install vim
```
### 4. 安装nodejs
```shell
wget -c https://github.com/guoyoujin/DockerLib/blob/master/node/node-v5.10.1.tar.gz?raw=true -O node-v5.10.1.tar.gz
tar xzvf node-v* && cd node-v*
./configure
make
make install
node --version
```

### 5.安装ruby的一些环境
```shell
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash

\curl -sSL https://get.rvm.io | bash -s stable --ruby

\curl -sSL https://get.rvm.io | bash -s stable --rails

source /etc/profile.d/rvm.sh

rvm reload

yum install gem

gem install sass
gem install gem-path
gem install compass
gem install oily_png
```
关于sass中文乱码问题解决办法移步<a href="http://blog.csdn.net/u012416928/article/details/53257322">链接</a>

http://nginx.org/download/nginx-1.6.2.tar.gz
