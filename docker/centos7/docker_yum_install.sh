#确保 yum 包更新到最新
sudo yum update

#查看你当前的内核版本
check_version=`uname -r`

echo "check uname version results are: $check_version"


#安装 Docker
yum -y install docker

#启动 Docker 后台服务
service docker start

#测试运行 hello-world,由于本地没有hello-world这个镜像，所以会下载一个hello-world的镜像，并在容器内运行。
docker run hello-world

#设置开机自启动
systemctl enable docker

#输出结果
#Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.

sudo yum install epel-release

sudo yum install -y python-pip

sudo pip install docker-compose