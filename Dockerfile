# base centos7 images
#
# version:                 1.0

FROM centos
MAINTAINER zhouwei<xiaomao361@163.com>

WORKDIR /home

# server init with yum 
RUN yum install -y passwd openssl openssh-server && \
	ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' && \
	ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
	ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''  && \
	echo "123456" | passwd --stdin root

# ports
EXPOSE 80 3306 22 

# change local timezone
RUN cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENV TZ="Asia/Shanghai"

CMD /usr/sbin/sshd&&tail -100f /var/log/yum.log
