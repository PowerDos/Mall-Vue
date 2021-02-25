# MALL 

> This is an e-commerce project including web end and back end.

> web end address:  http://180.76.150.95:30000

> back end gateway address: http://180.76.150.95:30001/swagger-ui.html

## Document
[中文](README-ZH.md) | [English](README.md)

## How to run
### use docker   
   ``` bash
   # run front-end project
   docker run -d -p 80:80 --name mall-web registry.cn-beijing.aliyuncs.com/w929732982/mall-web
   # view url
   http://127.0.0.1
   # run back-end project
   docker run -d -p 8848:8848 --name mall-nacos registry.cn-beijing.aliyuncs.com/w929732982/mall-nacos
   docker run -d -p 8000:8000 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-gateway registry.cn-beijing.aliyuncs.com/w929732982/mall-gateway
   docker run -d -p 8001:8001 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-goods-borwse registry.cn-beijing.aliyuncs.com/w929732982/mall-goods-borwse
   docker run -d -p 8002:8002 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-goods-feedback registry.cn-beijing.aliyuncs.com/w929732982/mall-goods-feedback
   docker run -d -p 8003:8003 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-goods-statics registry.cn-beijing.aliyuncs.com/w929732982/mall-goods-statics
   docker run -d -p 8004:8004 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-order-cancel registry.cn-beijing.aliyuncs.com/w929732982/mall-order-cancel
   docker run -d -p 8005:8005 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-order-create registry.cn-beijing.aliyuncs.com/w929732982/mall-order-create
   docker run -d -p 8006:8006 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-order-payment registry.cn-beijing.aliyuncs.com/w929732982/mall-order-payment
   docker run -d -p 8007:8007 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-user-info registry.cn-beijing.aliyuncs.com/w929732982/mall-user-info
   docker run -d -p 8008:8008 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-user-login registry.cn-beijing.aliyuncs.com/w929732982/mall-user-login
   docker run -d -p 8009:8009 -e NACOS_ADDR=http://127.0.0.1:8848 --name mall-user-register registry.cn-beijing.aliyuncs.com/w929732982/mall-user-register
   # view url
   http://127.0.0.1:8000/swagger-ui.html
   http://127.0.0.1:8848/nacos/index.html
```
## Prerequisites
**Structure description:**
> Files under "/doc" is the project level document, including requirement analysis，specified standard and etc.

- "Mall-server" is back end project.
- "Mall-web" is web end project.

## Why choose Mall？
- To provide a case of enterprise transformation from traditional architecture to Zhongtai.
- To be a case of DDD oriented design for microservice system.
- To provide a solution for e-commerce system including all platforms.

## Vision
- To provides a real case for the transformation of traditional enterprises to Zhongtai.
- Becoming a model of micro service development driven by DDD.


[Back end introduction](Mall-server/README.md)|[Web end introduction](Mall-web/README.md)

