#确保 yum 包更新到最新
sudo yum update

#执行 Docker 安装脚本,执行这个脚本会添加 docker.repo 源并安装 Docker。
curl -fsSL https://get.docker.com/ | sh

#启动 Docker 进程
sudo service docker start

#验证 docker 是否安装成功并在容器中执行一个测试的镜像
sudo docker run hello-world

#设置开机自启动
systemctl enable docker

#输出结果
#Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.