# Mall-server
(目前短信接口已过期，可能存在无法发送短信的问题。)

## 预览地址

> swagger: http://106.13.168.81:8000/swagger-ui.html <br>(硬件条件受限，仅允许了member和goods服务)

## 准备环境


* 准备docker环境 <br>

#单机k8s版本(QuickStart) 
> 为减小分支文件大小，k8s的分支需要的文件请移步我fork的地址： https://github.com/seethefruture/Mall-Vue-1/tree/k8s
* 1.安装好k8s环境 <br>
* 2.执行/Mall-server下的quick-start.sh脚本 <br>
* 3.npm run dev 启动前端项目 <br>
* 4.等待项目启动完成 <br>

##页面展示
### eureka
![eureka](runningshot/eureka.png)
### apollo
![apollo](runningshot/apollo.png)
### elasticsearch
![elasticsearch](runningshot/es.png)
### kibana
![kibana](runningshot/kibana.png)
### rabbitmq
![rabbitmq](runningshot/rabbitmq.png)
### zipkin
![zipkin](runningshot/zipkin.png)
### 项目swagger
![swagger](runningshot/zuul-swagger.png)


#docker版本(低配分布式推荐)
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

* 8.准备zipkin <br>
>使用docker镜像pull zipkin,下面是执行指令 (当然你也可以使用自己的zipkin)<br>
>1.**docker pull openzipkin/zipkin**<br>
>2.**docker run -d --name zipkin -p 9411:9411 openzipkin/zipkin**<br>
>3.登陆zipkin管理页面 http://127.0.0.1:9411

* 9.启动项目各个模块 <br>
>enjoy!

***注意看logs确保每个组件正确启动运行！***

## 使用组件介绍
* Eureka 注册中心
* Apollo 配置中心
* OpenFeign REST服务调用
* Hystrix 限流熔断
* Zuul 服务接口网关
* Zipkin 服务调用链路追踪
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
