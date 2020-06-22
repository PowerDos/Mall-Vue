package com.example.api;

import com.alibaba.fastjson.JSONObject;
import com.example.entitity.DTO.UserDTOInput;
import com.example.global.util.baseResponse.BaseResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author Administrator
 * @title: MemberRegistarService
 * @projectName MyProject
 * @description: TODO
 * @date 2020/2/2517:18
 */
@Api(tags = "会员注册接口")
public interface MemberRegisterService {
    /**
     * 用户注册接口
     *
     * @param userDTOInput
     * @return
     */
    @PostMapping("/register")
    @ApiOperation(value = "会员用户注册信息接口")
    BaseResponse<JSONObject> register(@RequestBody UserDTOInput userDTOInput,
                                      @RequestParam("registerCode") String registerCode,
                                      @RequestParam("mobile") String mobile);

    /**
     * 发送短信接口
     *
     * @param mobile
     * @return
     */
    @PostMapping("/sendSMS")
    @ApiOperation(value = "会员用户注册发送短信接口")
    BaseResponse<JSONObject> sendSMS(@RequestParam("mobile") String mobile);

    /**
     * 验证手机号接口
     *
     * @param mobile
     * @return
     */
    @PostMapping("/verifyMobile")
    @ApiOperation(value = "会员用户验证手机号接口")
    BaseResponse<JSONObject> verifyMobile(@RequestParam("mobile") String mobile,
                                          @RequestParam("registerCode") String registerCode);

}

