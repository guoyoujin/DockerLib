# make docker node images
### Software environment configuration
git version 1.8.3.1
Python 2.7.5
gcc version 4.8.5 20150623 (Red Hat 4.8.5-4) (GCC)

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

### 5.install rvm && ruby && rails
<a href="https://rvm.io/rvm/install">link</a>
```shell
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

\curl -sSL https://get.rvm.io | bash

\curl -sSL https://get.rvm.io | bash -s stable --ruby

\curl -sSL https://get.rvm.io | bash -s stable --rails

source /etc/profile.d/rvm.sh

rvm reload
```

### 6.install gem
```shell
yum install gem
```