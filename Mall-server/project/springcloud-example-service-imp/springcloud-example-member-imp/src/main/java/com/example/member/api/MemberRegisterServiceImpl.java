package com.example.member.api;/**
 * @title: A
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2518:07
 */

import com.alibaba.fastjson.JSONObject;
import com.example.api.MemberRegisterService;
import com.example.entitity.DO.UserEntityDO;
import com.example.entitity.DTO.UserDTOInput;
import com.example.global.util.sms.SmsUtil;
import com.example.member.mapper.UserMapper;
import com.example.global.util.MD5.MD5Util;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import com.example.global.util.constants.Constants;
import com.example.global.util.objectTransform.ObjectTransform;
import com.example.global.util.randomCode.RandomCodeGenerate;
import com.example.global.util.redis.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.UUID;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/25
 */
@RestController
public class MemberRegisterServiceImpl extends BaseApiService<JSONObject> implements MemberRegisterService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RedisUtil redisUtil;

    /**
     * 会员注册接口
     *
     * @param userDTOInput  会员信息DTo实体类
     * @param registerToken 准许注册的Token
     * @return JSONObject
     */
    public BaseResponse<JSONObject> register(@RequestBody UserDTOInput userDTOInput,
                                             @RequestParam("registerToken") String registerToken,
                                             @RequestParam("mobile") String mobile) {
        // 1.验证Token和参数是否正确
        String keyPrefixRegisterCode = Constants.REGISTER_CODE_KEY + mobile;
        String registerCode = redisUtil.getString(keyPrefixRegisterCode);
        if (registerCode == null || !registerCode.equals(registerToken)) {
            return setResultError("注册超时!");
        }
        userDTOInput.setMobile(mobile);
        String userName = userDTOInput.getUsername();
        String password = userDTOInput.getPassword();
        String email = userDTOInput.getEmail();
        //2.存放加密加盐的密码
        String encodePassWord = MD5Util.MD5(password);
        userDTOInput.setPassword(encodePassWord);
        System.out.println("用户注册" + userDTOInput);
        //3.添加到数据库
        UserEntityDO userEntityDO = ObjectTransform.dtoToDo(userDTOInput, UserEntityDO.class);
        userEntityDO.setCreateTime(new Date());
        userEntityDO.setUpdateTime(new Date());
        int registerResult = userMapper.register(userEntityDO);
        if (registerResult > 0) {
            //4.删除redis中的Token
            redisUtil.delKey(keyPrefixRegisterCode);
            return setResultSuccess("注册成功");
        } else {
            return setResultSuccess("注册失败");
        }
    }

    /**
     * 向注册的手机发送验证码
     *
     * @param mobile 发送验证码的手机号
     * @return JSONObject
     */
    @Override
    public BaseResponse<JSONObject> sendSMS(String mobile) {
        UserEntityDO userEntityDO = userMapper.existMobile(mobile);
        if (userEntityDO != null) {
            return setResultError(500, "该手机号已被注册");
        }
        String registerCode = RandomCodeGenerate.randomCode(5);
        System.out.println("验证码：" + registerCode);
//        boolean sendSuc = true;
        boolean sendSuc = SmsUtil.sendSMS(mobile, "", registerCode, "5");
        // 如果上个验证码未过期，删除上一个验证码
        String keyPrefix = Constants.MOBILE_CODE_KEY + mobile;
        String oldCode = redisUtil.getString(keyPrefix);
        if (oldCode != null) {
            redisUtil.delKey(keyPrefix);
        }
        // 如果向已经验证的手机号发送短信，则删除该手机号的验证Token
        String registerPrefix = Constants.REGISTER_CODE_KEY + mobile;
        String registerCodeValue = redisUtil.getString(registerPrefix);
        if (registerCodeValue != null) {
            redisUtil.delKey(registerPrefix);
        }
        if (sendSuc) {
            // 将验证码信息存放到redis中
            Long keyTimeout = Constants.MOBILE_CODE_TIMEOUT;
            redisUtil.setString(keyPrefix, registerCode, keyTimeout);
        }
        return sendSuc ? setResultSuccess("success") : setResultSuccess("fail");
    }

    /**
     * 验证手机号
     *
     * @param mobile       用户注册填写的手机号
     * @param registerCode 用户填写的验证码
     * @return JSONObject
     */
    @Override
    public BaseResponse<JSONObject> verifyMobile(String mobile, String registerCode) {
        // 1.验证用户的验证码是否正确
        String keyPrefixVerifyCode = Constants.MOBILE_CODE_KEY + mobile;
        String oldCode = redisUtil.getString(keyPrefixVerifyCode);
        if (oldCode != null && oldCode.equals(registerCode)) {
            // 验证码正确，删除原来的redis数据
            redisUtil.delKey(keyPrefixVerifyCode);
            //2.生成30分钟的Token给用户填写下一注册信息
            String keyPrefixRegisterCode = Constants.REGISTER_CODE_KEY + mobile;
            Long keyTimeout = Constants.REGISTER_CODE_TIMEOUT;
            String registerToken = UUID.randomUUID().toString();
            redisUtil.setString(keyPrefixRegisterCode, registerToken, keyTimeout);
            JSONObject response = new JSONObject();
            response.put("Token", registerToken);
            return setResultSuccess(response);
        }
        return setResultError("fail");
    }
}