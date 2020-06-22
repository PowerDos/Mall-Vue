package com.example.api;/**
 * @title: MemberService
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2518:48
 */

import com.example.entitity.DTO.UserDTOOutput;
import com.example.global.util.baseResponse.BaseResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/25
 */
@Api(tags = "会员服务接口")
public interface MemberService {
    /**
     * 根据手机号码查询是否已经存在,如果存在返回当前用户信息
     *
     * @param mobile
     * @return
     */
    @ApiOperation(value = "根据手机号码查询是否已经存在")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "mobile", dataType = "String", required = true, value = "用户手机号码"),})
    @PostMapping("/existMobile")
    BaseResponse<UserDTOOutput> existMobile(@RequestParam("mobile") String mobile);

    /**
     * 根据token查询用户信息
     *
     * @param token
     * @return
     */
    @GetMapping("/getUserInfo")
    @ApiOperation(value = "/getUserInfo")
    BaseResponse<UserDTOOutput> getInfo(@RequestParam("token") String token);
}

