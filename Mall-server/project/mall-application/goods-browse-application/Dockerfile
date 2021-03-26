FROM registry.cn-beijing.aliyuncs.com/w929732982/java-with-skywalking-agent:8

ENV NACOS_ADDR http://cloud-nacos.mall:8848
ENV MYSQL_HOST http://db-mall-mysql.mall:3306
ENV MYSQL_USR root
ENV MYSQL_PWD root
ENV SW_AGENT_COLLECTOR_BACKEND_SERVICES monitor-skywalking-server.mall:11800
ENV SW_AGENT_NAME goods-browse

COPY target /app
CMD java -javaagent:"/agent/skywalking-agent.jar" -Xms128m -Xmx512m  -XX:+UseG1GC -jar /app/goods-browse-application-1.0-SNAPSHOT.jar

EXPOSE 8001