FROM registry.cn-beijing.aliyuncs.com/w929732982/java-with-skywalking-agent:8

ENV NACOS_ADDR http://cloud-nacos.mall:8848
ENV SW_AGENT_COLLECTOR_BACKEND_SERVICES monitor-skywalking-server.mall:11800
ENV SW_AGENT_NAME goods-statistics

COPY target /app
CMD java -javaagent:"/agent/skywalking-agent.jar" -Xms128m -Xmx512m  -XX:+UseG1GC  -jar /app/goods-statistics-application-1.0-SNAPSHOT.jar

EXPOSE 8003