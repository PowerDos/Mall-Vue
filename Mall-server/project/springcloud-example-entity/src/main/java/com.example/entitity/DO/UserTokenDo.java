package com.example.entitity.DO;


import lombok.Data;

@Data
public class UserTokenDo extends BaseDo {
    /**
     * id
     */
    private Long id;
    /**
     * 用户token
     */
    private String token;
    /**
     * 登陆类型
     */
    private String loginType;
    /**
     * 设备信息
     */
    private String deviceInfo;
    /**
     * 登录ip信息
     */
    private String ipInfo;
    /**
     * 用户userId
     */
    private Long userId;
    /**
     * 是否被禁用 0:可用 1：不可用
     */
    private String disable;

}
