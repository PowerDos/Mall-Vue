package com.example.api;

import com.alibaba.fastjson.JSONObject;
import com.example.entitity.DTO.PayInfoDTOInput;
import com.example.global.util.baseResponse.BaseResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;

import javax.servlet.http.HttpServletRequest;


@Api(tags = "订单服务接口")
public interface OrderService {
    /**
     * 用户预支付接口
     *
     * @param payList 订单信息
     * @return 生成的订单信息token
     */
    @PostMapping("/prePay")
    @ApiOperation(value = "用户预支付")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "payList", value = "订单信息", required = true,type = "body")
    })
    BaseResponse<JSONObject> prePay(@RequestBody PayInfoDTOInput payList, HttpServletRequest request);

    /**
     * 用户查询订单信息接口
     *
     * @param userToken 用户登录状态token
     * @return 订单信息
     */
    @GetMapping("/loadOrders")
    @ApiOperation(value = "用户查询订单信息接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userToken", value = "用户登录状态token", required = true,type = "header")
    })
    BaseResponse<JSONObject> loadOrders(@RequestHeader("userToken") String userToken);
}
