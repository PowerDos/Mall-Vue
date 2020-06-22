package com.example.api;


import com.alibaba.fastjson.JSONObject;
import com.example.global.util.baseResponse.BaseResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;

@Api(tags = "秒杀服务接口")
public interface SecKillService {

    /**
     * 秒杀商品并下单
     */
    @ApiOperation(value = "秒杀商品并创建订单")
    @PostMapping("/SecKill")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userToken", value = "用户登录状态Token", required = true, paramType = "header"),
            @ApiImplicitParam(name = "secKillId", value = "秒杀内容id", required = true, paramType = "header")
    })
    BaseResponse<JSONObject> SecKill(@RequestHeader("userToken") String userToken, @RequestHeader("secKillId") String secKillId);

    /**
     * 秒杀商品
     *
     * @return BaseResponse<JSONObject>
     * JSONObject example:
     */
    @ApiOperation(value = "获取首页秒杀商品栏内容")
    @GetMapping("/loadSecKillInfo")
    BaseResponse<JSONObject> loadSecKillInfo();

    /**
     * 获取秒杀信息
     *
     * @return BaseResponse<JSONObject>
     * JSONObject example:
     */
    @ApiOperation(value = "获取秒杀商品信息")
    @GetMapping("/SecKillDetail")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "seckillId", value = "秒杀活动id", required = true, paramType = "header"),
    })
    BaseResponse<JSONObject> SecKillDetail(@RequestHeader("seckillId") Long seckillId);

    /**
     * 获取秒杀订单信息
     *
     * @return BaseResponse<JSONObject>
     * JSONObject example:
     */
    @ApiOperation(value = "查询秒杀订单信息")
    @PostMapping("/querysecKilStatue")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "seckillToken", value = "秒杀token", required = true, paramType = "header"),
    })
    BaseResponse<JSONObject> querysecKilStatue(@RequestHeader("seckillToken") String seckillToken);
}
