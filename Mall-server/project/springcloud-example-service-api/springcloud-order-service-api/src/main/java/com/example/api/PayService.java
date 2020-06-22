package com.example.api;

import com.alibaba.fastjson.JSONObject;
import com.example.global.util.baseResponse.BaseResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;

@Api(tags = "支付服务接口")
public interface PayService {

    /**
     * 用户支付服务接口
     *
     * @param payToken 订单token
     * @return
     */
    @PostMapping("/pay")
    @ApiOperation(value = "用户支付")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "payToken", value = "订单token", required = true)
    })
    BaseResponse<JSONObject> pay(@RequestParam("payToken") String payToken, HttpServletResponse response);

    /**
     * 查询用户支付状态接口
     *
     * @param body 支付宝支付同步返回的参数
     * @return 订单支付状态
     */
    @PostMapping("/queryPayStatue")
    @ApiOperation(value = "用户查询支付状态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "body", value = "支付宝支付同步返回的参数", required = true,type = "body"),
            @ApiImplicitParam(name = "payToken", value = "订单token", required = true,type = "header")
    })
    BaseResponse<JSONObject> queryPayStatue(@RequestBody String body,@RequestHeader("payToken")String payToken);
}
