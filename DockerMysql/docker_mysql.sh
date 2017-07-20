#! /bin/bash
#https://github.com/DaoCloud/library-image/tree/master/mysql
#chmod 755 docker_mysql.sh
docker search mysql
docker pull docker.io/mysql
docker stop mysql
docker rm mysql


docker run -v /system/mysql/data:/var/lib/mysql -v /system/mysql/conf.d:/etc/mysql/conf.d -v /system/mysql/log:/var/log/mysql --name mysql -p 3306:3306 --restart=always -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_USER=favorite_news -e MYSQL_PASSWORD=123456 -e MYSQL_DATABASE=favorite_news_production -e TZ=Asia/Shanghai -d mysql --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci