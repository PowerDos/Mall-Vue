kubectl delete namespace mall-basic

# build镜像
# basic
echo "start to build image:mall-mysql:5.7 ......"
docker rmi mall-mysql:5.7
docker build -t mall-mysql:5.7 k8s/images/mysql

echo "start to build image:mall-kibana:7.6.1 ......"
docker rmi mall-kibana:7.6.1
docker build -t mall-kibana:7.6.1 k8s/images/kibana

echo "start to build image:mall-logstash:7.6.1 ......"
docker rmi mall-logstash:7.6.1
docker build -t mall-logstash:7.6.1 k8s/images/logstash

echo "start to build image:mall-apollo-configservice:0.1 ......"
docker rmi mall-apollo-configservice:0.1
docker build -t mall-apollo-configservice:0.1 k8s/images/apollo/configservice
echo "start to build image:mall-apollo-adminservice:0.1 ......"
docker rmi mall-apollo-adminservice:0.1
docker build -t mall-apollo-adminservice:0.1 k8s/images/apollo/adminservice
echo "start to build image:mall-apollo-portal:0.1 ......"
docker rmi mall-apollo-portal:0.1
docker build -t mall-apollo-portal:0.1 k8s/images/apollo/portal

# application
echo "start to build image:mall-zuul:0.1 ......"
docker rmi mall-zuul:0.1
docker build -t mall-zuul:0.1 k8s/images/application/zuul


echo "start to build image:mall-member:0.1 ......"
docker rmi mall-member:0.1
docker build -t mall-member:0.1 k8s/images/application/member


echo "start to build image:mall-seckill:0.1 ......"c
docker rmi mall-seckill:0.1
docker build -t mall-seckill:0.1 k8s/images/application/seckill


echo "start to build image:mall-goods:0.1 ......"
docker rmi mall-goods:0.1
docker build -t mall-goods:0.1 k8s/images/application/goods


echo "start to build image:mall-remarks:0.1 ......"
docker rmi mall-remarks:0.1
docker build -t mall-remarks:0.1 k8s/images/application/remarks

echo "start to build image:mall-order:0.1 ......"
docker rmi mall-order:0.1
docker build -t mall-order:0.1 k8s/images/application/order

# 创建 k8s pod
kubectl create namespace mall-basic

echo "start to create k8s pod:mall-mysql......"
kubectl create -f k8s/pod/mall-mysql.yaml

echo "start to create k8s pod:mall-redis......"
kubectl create -f k8s/pod/mall-redis.yaml

echo "start to create k8s pod:mall-rabbitmq......"
kubectl create -f k8s/pod/mall-rabbitmq.yaml

echo "start to create k8s pod:mall-zipkin......"
kubectl create -f k8s/pod/mall-zipkin.yaml

echo "start to create k8s pod:mall-elasticsearch......"
kubectl create -f k8s/pod/mall-elasticsearch.yaml

echo "start to create k8s pod:mall-kibana......"
kubectl create -f k8s/pod/mall-kibana.yaml

echo "start to create k8s pod:mall-logstash......"
kubectl create -f k8s/pod/mall-logstash.yaml

echo "start to create k8s pod:mall-apollo......"
kubectl create -f k8s/pod/mall-apollo-configservice.yaml
kubectl create -f k8s/pod/mall-apollo-adminservice.yaml
kubectl create -f k8s/pod/mall-apollo-portal.yaml



echo "start to create k8s pod:mall-application ......"
kubectl create -f k8s/pod/mall-application.yaml

# 开放端口
kubectl create -f k8s/service/mysqlport.yaml
kubectl create -f k8s/service/redisport.yaml
kubectl create -f k8s/service/rabbitmqport.yaml
kubectl create -f k8s/service/esport.yaml
kubectl create -f k8s/service/kibanaport.yaml
kubectl create -f k8s/service/zipkinport.yaml
kubectl create -f k8s/service/eurekaport.yaml
kubectl create -f k8s/service/apolloport.yaml
kubectl create -f k8s/service/adminport.yaml
kubectl create -f k8s/service/appPort.yaml
#kubectl port-forward mall-basic 3306 6379 5672 15672 9200 9300 5601 9411 8080 8070 -n mall-basic 仅供测试

echo "wait a minute and you will be able to view elasticsearch on http://127.0.0.1:30001"
echo "wait a minute and you will be able to view mysql on http://127.0.0.1:30002"
echo "wait a minute and you will be able to view eureka on http://127.0.0.1:30003"
echo "wait a minute and you will be able to view apollo on http://127.0.0.1:30004"
echo "wait a minute and you will be able to view kibana on http://127.0.0.1:30005"
echo "wait a minute and you will be able to view zuul on http://127.0.0.1:30006"
echo "wait a minute and you will be able to view rabbit-manager on http://127.0.0.1:30007"
echo "wait a minute and you will be able to view zipkin on http://127.0.0.1:30008"
# finish
echo "press any key to exit"
read
