# Mall-server
## 准备环境

* 准备docker环境 <br>
[docker安装配置教程]()
>首先安装配置完docker

* 1.准备mysql <br>
>使用docker镜像pull mysql:5.7,下面是执行指令 (当然你也可以使用自己的mysql)<br>
>1.**docker pull mysql:5.7**<br>
>2.**docker run -d -p 3306:3306 --name mysql  -e MYSQL_ROOT_PASSWORD=root mysql:5.7**<br>
>在mysql中导入需要的sql文件(在/sql目录下)共6个sql文件。数据库统一采用innodb，utf-8mbf字符集

* 2.准备redis <br>
>使用docker镜像pull redis,下面是执行指令 (当然你也可以使用自己的redis)<br>
>1.**docker pull redis:6.0.5**<br>
>2.**docker run -d --name redis -p 6379:6379 redis:6.0.5**<br>

* 3.准备rabbitmq <br>
>使用docker镜像pull rabbitmq,下面是执行指令 (当然你也可以使用自己的rabbitmq)<br>
>1.**docker pull rabbitmq:3.8.2-management**<br>
>2.**docker run -d --name rabbitmq -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=root -e RABBITMQ_DEFAULT_PASS=root rabbitmq:3.8.2-management**<br>

* 4.准备elasticsearch <br>
>使用docker镜像pull elasticsearch,下面是执行指令 (当然你也可以使用自己的elasticsearch)<br>
>1.**docker pull elasticsearch:7.6.1**<br>
>2.**docker run -d --name elasticsearch -e discovery.type=single-node -p 9200:9200 -p 9300:9300 elasticsearch:7.6.1**<br>
>3.增加/elasticsearch下的index到elasticsearch

* 5.准备kibana <br>
>使用docker buile dockfile(在/kibana目录下，当然你也可以使用自己的kibana，只需修改配置文件)<br>
>1.进入kabana目录<br>
>2.**docker build -t mall-kibana:0.1 .**<br>
>3.**docker run -d --name kibana -p 5601:5601 mall-kibana:0.1**<br>

* 6.准备logstash <br>
>使用docker buile dockfile(在/logstash目录下，当然你也可以使用自己的logstash，只需修改配置文件)<br>
>1.进入logstash目录<br>
>2.**docker build -t mall-logstash:0.1 .**<br>
>3.**docker run -d --name logstash mall-logstash:0.1**<br>

* 7.准备apollo <br>
>使用docker-compose up(在/apollo目录下，当然你也可以使用自己的apollo)<br>
>1.进入apollo目录<br>
>2.**docker-compose up**<br>
>3.导入项目配置（在/config目录下）<br>

* 8.启动项目各个模块 <br>
>enjoy!

***注意看logs确保每个组件正确启动运行！***

## 使用组件介绍
* Eureka 注册中心
* Apollo 配置中心
* OpenFeign REST服务调用
* Hystrix 限流熔断
* Zuul 服务接口网关
## 项目目录介绍
* springcloud-example-common <br>
`项目公用模块`
    * springcloud-example-handler <br>
    `项目公用异常处理模块，待完善`
    * springcloud-example-common <br>
    `项目公用util`
* springcloud-example-basic <br>
`微服务基础设施模块`
    * springcloud-example-zuul <br>
    `项目网关模块`
* springcloud-example-entity <br>
`项目实体类模块（DO,TOD等）`
* springcloud-example-service-api <br>
`微服务接口api模块（member,goods,order,remark,seckill等）`
* springcloud-example-service-imp <br>
`微服务接口实现模块（member,goods,order,remark,seckill等）`


