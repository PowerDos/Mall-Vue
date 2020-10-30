package com.example.member.api;

import com.example.api.MemberLoginServiceApi;
import com.example.entitity.DO.UserEntityDO;
import com.example.entitity.DO.UserTokenDo;
import com.example.entitity.DTO.UserLoginInpDTO;
import com.example.member.mapper.UserMapper;
import com.example.member.mapper.UserTokenMapper;
import com.example.global.util.MD5.MD5Util;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponseStruct;
import com.example.global.util.config.Config;
import com.example.global.util.constants.Constants;
import com.example.global.util.requestUtil.RequestUtil;
import com.example.global.util.tokenGenerate.TokenGenerate;
import jdk.nashorn.internal.runtime.regexp.joni.exception.InternalException;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;

@RestController
public class MemberLoginServiceImpl extends BaseApiService<JSONObject> implements MemberLoginServiceApi {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private TokenGenerate tokenGenerate;
    @Autowired
    private UserTokenMapper userTokenMapper;
    @Autowired
    private Config config;

    @Override
    public BaseResponseStruct<JSONObject> login(@RequestBody UserLoginInpDTO userLoginInpDTO, HttpServletRequest request) {
        String mobile = userLoginInpDTO.getMobile();
        String password = userLoginInpDTO.getPassword();
        String deviceInfo = userLoginInpDTO.getDeviceInfo();
        // 判断登陆类型
        String loginType = userLoginInpDTO.getLoginType();
        if (!config.getSupportPlatforms().contains(loginType)) {
            return setResultError("登陆类型出现错误!");
        }

        // 2.效验密码
        String newPassWord = MD5Util.generateMD5String(password);
        UserEntityDO userDo = userMapper.login(mobile, newPassWord);
        if (userDo == null) {
            return setResultError("用户名称或者密码错误!");
        }
        // 登录信息包括（mysql登陆历史 + redis授权令牌）
        try {
            // 3.保存此次登录信息
            Long userId = userDo.getUserId();
            String token = userTokenMapper.getTokenByUserIdAndLoginType(userId, loginType);
            // 4.当前用户在其他设备登录
            if (token != null) {
                // 清除redis中之前的授权token
                // TODO 在这里有待优化，redis事务中del无法确保成功删除
                tokenGenerate.removeToken(token);

                int result = userTokenMapper.disableToken(token);
                if (result <= 0) {
                    // 更新数据库token状态失败！
                    throw new InternalException("系统错误!");
                }
            }
            // 5.生成redis令牌
            String keyPrefix = Constants.MEMBER_TOKEN_KEYPREFIX + loginType;
            String newOnlineToken = tokenGenerate.createToken(keyPrefix, userId + "", Constants.MEMBER_TOKEN_TIMEOUT);

            // 6.保存mysql登陆历史
            UserTokenDo userToken = new UserTokenDo();
            userToken.setUserId(userId);
            userToken.setLoginType(userLoginInpDTO.getLoginType());
            userToken.setToken(newOnlineToken);
            userToken.setDeviceInfo(deviceInfo);
            userToken.setIpInfo(RequestUtil.getIPAddress(request));
            int result = userTokenMapper.insertUserToken(userToken);
            if (result <= 0) {
                // 插入登录信息到数据库失败！
                throw new InternalException("系统错误!");
            }
            // 7.返回token
            JSONObject data = new JSONObject();
            data.put("token", newOnlineToken);
            data.put("username", userDo.getUsername());
            return setResultSuccess(data);
        } catch (Exception e) {
            throw new InternalException("系统错误!");
        }
    }

    @Override
    public BaseResponseStruct<JSONObject> signOut(HttpServletRequest request) {
        String token = RequestUtil.getCookieValue(request, "token");
        String mobile = RequestUtil.getCookieValue(request, "mobile");

        if (StringUtils.isEmpty(token) || StringUtils.isEmpty(mobile)) {
            return setResultError("当前在线状态非法");
        }
        //验证toke是否是该用户的
        Long userId = userMapper.getUserIdByMobile(mobile);
        //删除redis中的token
        String tokenUserId = tokenGenerate.getToken(token);
        if (tokenUserId != null && tokenUserId.equals(userId.toString())) {
            //修改数据库中的登录状态
            int result = userTokenMapper.disableToken(token);
            if (result <= 0) {
                return setResultError("下线失败，请稍后再试");
            }
            tokenGenerate.removeToken(token);
            return setResultSuccess();
        } else {
            return setResultError("当前在线状态非法");
        }

    }

    @Override
    public BaseResponseStruct<JSONObject> checkLoginStatue(String loginToken) {
        String userId = tokenGenerate.getToken(loginToken);
        if (userId == null) {
            // 当前的token已经下线
            UserTokenDo formerTokenInfo = userTokenMapper.queryLoginInfo(loginToken);
            String loginType = formerTokenInfo.getLoginType();
            UserTokenDo newTokenInfo = userTokenMapper.queryLoginInfoByLoginTypeAndUserId(loginType, formerTokenInfo.getUserId());
            if (newTokenInfo == null) {
                return setResultSuccess("offline");
            } else {
                JSONObject newLoginInfo = new JSONObject();
                newLoginInfo.put("deviceInfo", newTokenInfo.getDeviceInfo());
                newLoginInfo.put("ip", newTokenInfo.getIpInfo());
                newLoginInfo.put("time", newTokenInfo.getCreatedTime());
                return setResult(200, "out", newLoginInfo);
            }
        }
        return setResultSuccess("online");
    }
}
