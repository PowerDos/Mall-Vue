package com.example.global.util.constants;

/**
 * @author Administrator
 * @title: A
 * @projectName MyProject
 * @description: TODO
 * @date 2020/2/2517:46
 */
public interface Constants {
    // 响应请求成功
    String HTTP_RES_CODE_200_VALUE = "success";
    // 响应请求成功code
    Integer HTTP_RES_CODE_200 = 200;
    // 系统错误
    Integer HTTP_RES_CODE_500 = 500;
    // 手机注册码存放redis key
    String MOBILE_CODE_KEY = "verify.code";
    // 手机注册码有效期5分钟
    Long MOBILE_CODE_TIMEOUT = 301L;
    // 允许注册时间Token存放redis key
    String REGISTER_CODE_KEY = "register.token";
    // 手机注册码填写正确有一分钟时间填写下一步注册信息
    Long REGISTER_CODE_TIMEOUT = 1801L;
    // 用户信息不存在
    Integer HTTP_RES_CODE_EXISTMOBILE_203 = 203;
    // token
    String MEMBER_TOKEN_KEYPREFIX = "login";
    //用户token有效期
    Long MEMBER_TOKEN_TIMEOUT = 301L;

    // 预支付订单存放redis_key
    String PAY_TRANSACTION_KEY = "pay.transaction";
    // 预支付订单有效期30分钟
    Long PAY_TRANSACTION_TIMEOUT = 1801L;
    // 秒杀单用户限制频率redis key
    String SECKILL_WAIT_KEY = "seckill.wait";
    // 秒杀订单Token有效期10分钟
    Long SECKILL_TOKEN_TIMEOUT = 601L;


}
