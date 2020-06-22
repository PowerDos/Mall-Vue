package com.example.member.api;

import com.example.api.MemberLoginService;
import com.example.entitity.DO.UserEntityDO;
import com.example.entitity.DO.UserTokenDo;
import com.example.entitity.DTO.UserLoginInpDTO;
import com.example.member.mapper.UserMapper;
import com.example.member.mapper.UserTokenMapper;
import com.example.global.util.MD5.MD5Util;
import com.example.global.util.Transaction.Redis_DataBaseTransaction;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import com.example.global.util.config.Config;
import com.example.global.util.constants.Constants;
import com.example.global.util.requestUtil.RequestUtil;
import com.example.global.util.tokenGenerate.TokenGenerate;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.TransactionStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@RestController
public class MemberLoginServiceImpl extends BaseApiService<JSONObject> implements MemberLoginService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private TokenGenerate tokenGenerate;
    @Autowired
    private UserTokenMapper userTokenMapper;
    @Autowired
    private Config config;
    @Autowired
    private Redis_DataBaseTransaction transaction;

    @Override
    public BaseResponse<JSONObject> login(@RequestBody UserLoginInpDTO userLoginInpDTO, HttpServletRequest request) {
        String mobile = userLoginInpDTO.getMobile();
        String password = userLoginInpDTO.getPassword();
        String deviceInfo = userLoginInpDTO.getDeviceInfo();
        // 判断登陆类型
        String loginType = userLoginInpDTO.getLoginType();
        if (!config.getSupportPlatforms().contains(loginType)) {
            return setResultError("登陆类型出现错误!");
        }

        // 2.效验密码
        String newPassWord = MD5Util.MD5(password);
        UserEntityDO userDo = userMapper.login(mobile, newPassWord);
        if (userDo == null) {
            return setResultError("用户名称或者密码错误!");
        }
        TransactionStatus transactionStatus = transaction.begin();
        try {
            // 3.更新数据库的登录历史信息
            Long userId = userDo.getUserId();
            UserTokenDo userTokenDo = userTokenMapper.selectByUserIdAndLoginType(userId, loginType);
            if (userTokenDo != null) {
                // 清除redis中之前的授权token
                // TODO 在这里有待优化，redis事务中del无法确保成功删除
                String token = userTokenDo.getToken();
                tokenGenerate.removeToken(token);

                int result = userTokenMapper.disableToken(token);
                if (result <= 0) {
                    // 更新数据库token状态失败！
                    transaction.rollback(transactionStatus);
                    return setResultError("系统错误!");
                }
            }
            // 4.生成对应用户令牌存放在redis中
            String keyPrefix = Constants.MEMBER_TOKEN_KEYPREFIX + loginType;
            String newOnlineToken = tokenGenerate.createToken(keyPrefix, userId + "",Constants.MEMBER_TOKEN_TIMEOUT);

            // 5.插入新登录信息到数据库
            UserTokenDo userToken = new UserTokenDo();
            userToken.setUserId(userId);
            userToken.setLoginType(userLoginInpDTO.getLoginType());
            userToken.setToken(newOnlineToken);
            userToken.setDeviceInfo(deviceInfo);
            userToken.setIpInfo(RequestUtil.getIPAddress(request));
            int result = userTokenMapper.insertUserToken(userToken);
            if (result <= 0) {
                // 插入登录信息到数据库失败！
                transaction.rollback(transactionStatus);
                return setResultError("系统错误！");
            }
            transaction.commit(transactionStatus);
            // 6.返回token
            JSONObject data = new JSONObject();
            data.put("token", newOnlineToken);
            data.put("username", userDo.getUsername());
            return setResultSuccess(data);
        } catch (Exception e) {
            try {
                transaction.rollback(transactionStatus);
                return setResultError("系统错误！");
            } catch (Exception ex) {
                return setResultError("系统错误！");
            }
        }
    }

    @Override
    public BaseResponse<JSONObject> signOut(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String token = "";
        String mobile = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                token = cookie.getValue();
            }
            if (cookie.getName().equals("mobile")) {
                mobile = cookie.getValue();
            }
        }
        if (StringUtils.isEmpty(token) || StringUtils.isEmpty(mobile)) {
            return setResultError("当前在线状态非法");
        }
        //验证toke是否是该用户的
        UserEntityDO user = userMapper.findByMobile(mobile);
        Long userId = user.getUserId();
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
    public BaseResponse<JSONObject> checkLoginStatue(String loginToken) {
        String userId = tokenGenerate.getToken(loginToken);
        if (userId == null) {
            // 当前的token已经下线
            UserTokenDo formerTokenInfo = userTokenMapper.queryLoginInfo(loginToken);
            String loginType = formerTokenInfo.getLoginType();
            UserTokenDo newTokenInfo = userTokenMapper.queryLoginInfoByLoginTypeAndUserId(loginType, formerTokenInfo.getUserId());
            if(newTokenInfo==null){
                return setResultSuccess("offline");
            }else {
                JSONObject newLoginInfo = new JSONObject();
                newLoginInfo.put("deviceInfo",newTokenInfo.getDeviceInfo());
                newLoginInfo.put("ip",newTokenInfo.getIpInfo());
                newLoginInfo.put("time",newTokenInfo.getCreateTime());
                return setResult(200,"out",newLoginInfo);
            }
        }
        return setResultSuccess("online");
    }
}
