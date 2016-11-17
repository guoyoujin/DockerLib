# DockerLib
此项目是我在练习docker的时候用到的一些工具

### docker  常用命令
```shell
docker ps -a  ##查看所有容器

docker ps     ##查看运行的容器

docker images ##查看镜像源

docker stop     dockerName  ##停止容器

docker start    dockerName  ##启动容器

docker restart  dockerName  ##重启容器

docker exec -it dockerName /bin/bash ##进入容器里面

docker logs dockerName     ##查看日志

docker logs -f dockerName  ##查看日志

docker run --name node5.10.1 -i -t centos7 bash ##已centos7为镜像源run一个叫node5.10.1的容器，并且进入容器里面

docker build -t centos7 . ##存在Dockerfile的情况下，即可build一个名叫centos7的镜像

docker commit -m "node 5.10.1" docker_node5.10.1 docker_node5.10.1  ##在容器docker_node5.10.1的基础上创建一个新的镜像docker_node5.10.1

docker save -o 20161114_docker_node5.10.1.tar docker_node5.10.1 ###导出镜像

```



# License

```
Copyright 2016 trycatch

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```