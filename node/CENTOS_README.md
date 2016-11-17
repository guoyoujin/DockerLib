# If below 1,2,3,4 Environment you have, then start directly from the 5 can be
### 1. install wget
```shell
yum update
yum install wget
```

### 2.install make
```shell
yum install make
```

### 3.install tar
```shell
yum install tar
```

### 4.install gcc gcc-c++
```shell
yum install gcc gcc-c++
```

### 5.download
```shell
wget -c https://github.com/guoyoujin/DockerLib/blob/master/node/node-v5.10.1.tar.gz?raw=true -O node-v5.10.1.tar.gz
```
or
```
wget -c https://github.com/guoyoujin/DockerLib/blob/master/node/node-v6.9.1.tar.gz?raw=true -O node-v6.9.1.tar.gz
```

### 6.tar file
```shell
tar xzvf node-v* && cd node-v*
```

### 7.compiling & install
```shell
./configure
make
make install
```

### 8.Check the version
```
node --version
```