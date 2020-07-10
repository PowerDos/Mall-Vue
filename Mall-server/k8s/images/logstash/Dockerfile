FROM logstash:7.6.1
COPY logstash-sample.conf /usr/share/logstash/config
COPY logstash.yml /usr/share/logstash/config
COPY driver.jar /usr/share/logstash/jdbcdriver/
COPY pipelines.yml /usr/share/logstash/config
COPY example_goods.conf /usr/share/logstash/pipeline

