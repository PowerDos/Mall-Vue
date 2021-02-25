# MALL-VUE
[![Build Status](https://travis-ci.com/PowerDos/Mall-Vue.svg?branch=master)](https://travis-ci.com/PowerDos/Mall-Vue)
[![VueJS Version](https://img.shields.io/badge/VueJS-v2.5-green.svg?style=flat-square)](https://vuejs.org/)
[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)
[![Read the Docs (version)](https://img.shields.io/readthedocs/pip/stable.svg)](https://github.com/PowerDos/Mall-Vue)
[![status](https://img.shields.io/badge/Mall--Vue-maintain-brightgreen.svg)](https://standardjs.com)
[![npm version](https://img.shields.io/badge/npm-v5.5.1-brightgreen.svg)](https://standardjs.com)
[![iview version](https://img.shields.io/badge/iview-2.13.1-brightgreen.svg)](https://standardjs.com)
[![author](https://img.shields.io/badge/author-Gavin-brightgreen.svg)](https://standardjs.com)

> 这是一个基于VUE + VUEX + iView做的一个电商网站前端项目, 附带前后端分离实现版本(在**forMallServer**分支)，欢迎fork或star


> 项目预览地址(demo)： [https://powerdos.github.io/Mall-Vue/index.html](https://powerdos.github.io/Mall-Vue/index.html "Mall-Vue")

## Document
[中文](https://github.com/PowerDos/Mall-Vue/blob/master/README-ZH.md) | [English](https://github.com/PowerDos/Mall-Vue/blob/master/README.md)

## 说明
**分支介绍：**
> **master**分支是单纯的前端项目。(技术栈：Vue+Vuex+iView)

> **forMallServer**分支为与后端接口结合的前端项目，附后端API项目(技术栈：Spring+Struts+Hibernate)地址：[https://github.com/PowerDos/Mall-Server](https://github.com/PowerDos/Mall-Server), 本项目仅供学习参考

> **Mall-CI**分支是包含了前端，后端，移动端的项目(正在开发中，流程请关注Projects)

**更好的clone：**
> 如果你仅仅想体验master的纯前端项目，我们强烈建议您使用 **git clone {repo} --depth=1** 来获取master分支

> 如果你想git整个镜像（178M），请确保您的网络速度达到要求或是使用其他代理工具

## Build Setup

### Using Node
``` bash
# 安装依赖
npm install

# 开发模式
npm run dev

# 打包
npm run build
```
### Using Docker
```
docker run -d -p 80:80 --name mall-web registry.cn-beijing.aliyuncs.com/w929732982/mall-web 
```
> view url:  http://127.0.0.1

## TO-DO-LIST
- [x] [首页 HOME PAGE](#首页-home-page)
- [x] [登陆 LOGIN PAGE](#登陆-login-page)
- [x] [注册 SIGNUP PAGE](#注册-signup-page)
- [x] [商品搜索页面 PRODUCT LIST PAGE](#商品搜索页面-product-list-page)
- [x] [商品详情页面 PRODUCT DETAIL PAGE](#商品详情页面-product-detail-page)
- [x] [购物车页面 SHOPPING CART PAGE](#购物车页面-shopping-cart-page)
- [x] [确认订单页面 ORDER PAGE](#确认订单页面-order-page)
- [x] [支付页面 PAY PAGE](#支付页面-pay-page)
- [x] [购买成功页面 SUCCESS PAGE](#购买成功页面-success-page)
- [x] [反馈页面 FREEBACK PACE](#%E5%8F%8D%E9%A6%88%E9%A1%B5%E9%9D%A2-freeback-page)
- [x] [商家店铺页面 MERCHANT PAGE](#商家店铺页面-merchant-page)
- [x] [用户页面 USER PAGE](#用户页面-user-page)

## PAGE

### 首页 HOME PAGE
![首页1](https://i.imgur.com/cNtx70M.png)
![首页2](https://i.imgur.com/ju5lfUc.png)
![首页3](https://i.imgur.com/K8MMYGq.png)

### 商品搜索页面 PRODUCT LIST PAGE
![商品搜索页面1](https://i.imgur.com/Wu7TJ4G.png)
![商品搜索页面2](https://i.imgur.com/ZTDRB2X.png)

### 商品详情页面 PRODUCT DETAIL PAGE
![商品详情页面1](https://i.imgur.com/0SQxUCN.png)
![商品详情页面2](https://i.imgur.com/kBiQM9O.png)
![商品详情页面3](https://i.imgur.com/aERYRmX.png)
![商品详情页面4](https://i.imgur.com/vRpvcvj.png)

### 购物车页面 SHOPPING CART PAGE
![购物车页面](https://i.imgur.com/m5tftN7.png)

### 确认订单页面 ORDER PAGE
![确认订单页面](https://i.imgur.com/iNM3CQH.png)

### 支付页面 PAY PAGE
![支付页面](https://i.imgur.com/4OdCynR.png)

### 购买成功页面 SUCCESS PAGE
![购买成功页面](https://i.imgur.com/tOATGZP.png)

### 反馈页面 FREEBACK PACE
![反馈页面](https://i.imgur.com/fbOZAH8.png)

### 商家店铺页面 MERCHANT PAGE
![商家店铺页面](https://i.imgur.com/Zgu54lw.png)

### 用户页面 USER PAGE
![用户页面](https://i.imgur.com/ttCwhyT.png)

### 登陆 LOGIN PAGE
![登陆页面](https://i.imgur.com/d16GjOi.png)

### 注册 SIGNUP PAGE
![注册页面](https://i.imgur.com/no4Cb65.png)
