FROM java:8

ENV NACOS_ADDR http://cloud-nacos.mall:8848
ENV MYSQL_HOST http://db-mall-mysql.mall:3306
ENV MYSQL_USR root
ENV MYSQL_PWD root

COPY target /app
CMD java -jar /app/goods-browse-application-1.0-SNAPSHOT.jar NACOS_ADDR=${NACOS_ADDR}

EXPOSE 8001