FROM mysql:5.7

#apollo
COPY sql/apolloportaldb.sql /usr/sql/
COPY sql/apolloconfigdb.sql /usr/sql/

RUN mv /usr/sql/apolloportaldb.sql /docker-entrypoint-initdb.d
RUN mv /usr/sql/apolloconfigdb.sql /docker-entrypoint-initdb.d

RUN rm -f /usr/sql/apolloportaldb.sql
RUN rm -f /usr/sql/apolloconfigdb.sql

#application
COPY sql/example_goods.sql /usr/sql/
COPY sql/example_member.sql /usr/sql/
COPY sql/example_order.sql /usr/sql/
COPY sql/example_remarks.sql /usr/sql/
COPY sql/example_seckill.sql /usr/sql/
COPY sql/example_shop.sql /usr/sql/

RUN mv /usr/sql/example_goods.sql /docker-entrypoint-initdb.d
RUN mv /usr/sql/example_member.sql /docker-entrypoint-initdb.d
RUN mv /usr/sql/example_order.sql /docker-entrypoint-initdb.d
RUN mv /usr/sql/example_remarks.sql /docker-entrypoint-initdb.d
RUN mv /usr/sql/example_seckill.sql /docker-entrypoint-initdb.d
RUN mv /usr/sql/example_shop.sql /docker-entrypoint-initdb.d

RUN rm -f /usr/sql/example_goods.sql
RUN rm -f /usr/sql/example_member.sql
RUN rm -f /usr/sql/example_order.sql
RUN rm -f /usr/sql/example_remarks.sql
RUN rm -f /usr/sql/example_seckill.sql
RUN rm -f /usr/sql/example_shop.sql
