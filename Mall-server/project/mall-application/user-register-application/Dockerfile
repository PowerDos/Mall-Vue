FROM java:8

ENV NACOS_ADDR http://cloud-nacos.mall:8848

COPY target /app
CMD java -jar /app/user-register-application-1.0-SNAPSHOT.jar NACOS_ADDR=${NACOS_ADDR}

EXPOSE 8009