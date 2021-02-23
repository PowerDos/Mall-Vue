FROM java:8

ENV NACOS_URL http://cloud-nacos.mall:8848

COPY target /app
CMD java -jar /app/goods-browse-application-1.0-SNAPSHOT.jar
EXPOSE 8001