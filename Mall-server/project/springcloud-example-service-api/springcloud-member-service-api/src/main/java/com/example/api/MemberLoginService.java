package com.example.api;

import com.example.entitity.DTO.UserLoginInpDTO;
import com.example.global.util.baseResponse.BaseResponse;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestHeader;

import javax.servlet.http.HttpServletRequest;

@Api(tags = "用户登陆服务接口")
public interface MemberLoginService {
    /**
     * 用户登陆接口
     *
     * @param userLoginInpDTO
     * @return
     */
    @PostMapping("/login")
    @ApiOperation(value = "会员用户登陆信息接口")
    BaseResponse<JSONObject> login(@RequestBody UserLoginInpDTO userLoginInpDTO, HttpServletRequest request);

    /**
     * 用户退出接口
     *
     * @param request 用户的手机号 session:mobile,token
     * @return
     */
    @PostMapping("/signOut")
    @ApiOperation(value = "会员用户退出接口")
    BaseResponse<JSONObject> signOut(HttpServletRequest request);

    /**
     * 用户查询登录状态接口
     *
     * @param loginToken 用户的登录token
     * @return  "online"在线  "offline"超时下线
     *          "[JSONObject]"
     *          {"loginType":登录类型
     *           "deviceInfo":登录设备
     *           "ipInfo":ip地址
     *           "create_time":登录时间
     *          }
     */
    @PostMapping("/checkLoginStatue")
    @ApiOperation(value = "用户查询登录状态接口")
    @ApiImplicitParams(
            @ApiImplicitParam(value = "loginToken",name = "用户的登录token",type = "header",required = true)
    )
    BaseResponse<JSONObject> checkLoginStatue(@RequestHeader("loginToken") String loginToken);

}
