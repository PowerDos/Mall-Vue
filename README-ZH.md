# MALL

> 这是一个集web端，后端的电商项目

> web端地址： http://180.76.150.95:30000

> 后端网关地址： http://180.76.150.95:30001/swagger-ui.html

## 文档
[中文](README-ZH.md) | [English](README.md)

## 如何运行
### 使用docker   
   ``` bash
   # 运行前端项目
   docker run -d -p 80:80 --name mall-web registry.cn-beijing.aliyuncs.com/w929732982/mall-web
   # 预览地址
   http://127.0.0.1
   # 运行后端项目
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
   # 预览地址
   http://127.0.0.1:8000/swagger-ui.html
   http://127.0.0.1:8848/nacos/index.html
   ```
## 说明
**结构介绍:**
> "/doc"下是项目级文档,包含需求分析和规范制定等

- Mall-server是后端项目 
- Mall-web是web端项目 

## 为什么选择Mall？
- 提供一个企业由传统架构向中台转型的案例
- 作为以DDD导向设计微服务系统的案例
- 提供一个包含全端的电商系统解决方案

## 愿景
- 为传统企业向中台转型提供一个真实的案例
- 成为DDD驱动微服务开发的典范


[后端介绍](Mall-server/README.md)|[web端介绍](Mall-web/README.md)

