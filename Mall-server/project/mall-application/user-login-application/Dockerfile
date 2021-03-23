FROM java:8

ENV NACOS_ADDR http://cloud-nacos.mall:8848

COPY target /app
CMD java -Xms128m -Xmx512m  -XX:+UseG1GC  -jar /app/user-login-application-1.0-SNAPSHOT.jar

EXPOSE 8008