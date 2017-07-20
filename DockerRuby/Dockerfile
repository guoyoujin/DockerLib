# ruby images base on centos7
#
# incloud: ruby 2.3.1 rails 5.0.0
# use: docker run -d --name you_app_name -v /you_path:/home -p port:3000 you_image_name
#
# version:                 1.0
# docker build -t ruby .
FROM docker.io/centos
MAINTAINER zhouwei<zhouw@tongxinyiliao.com>

WORKDIR /home

VOLUME /home

# server init with yum
RUN yum  -y update
RUN yum -y install gcc gcc-c++ ncurses-devel perl pcre-devel openssl openssl-devel libcurl-devel vim tar which crontabs rsyslog mysql-devel

# change local timezone
RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# install rvm
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "source /etc/profile.d/rvm.sh"

# install ruby and rails
RUN /bin/bash -l -c "rvm install 2.3.1"
# RUN /bin/bash -l -c "gem sources -a http://gems.ruby-china.org/ --remove https://rubygems.org/"
RUN /bin/bash -l -c "gem install rails -v '5.0.0'"
RUN /bin/bash -l -c "gem install puma"

# install nodejs
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs

# copy script and other things
ADD start.sh /usr/bin/start.sh

EXPOSE 3000

CMD ["bash","/usr/bin/start.sh"]