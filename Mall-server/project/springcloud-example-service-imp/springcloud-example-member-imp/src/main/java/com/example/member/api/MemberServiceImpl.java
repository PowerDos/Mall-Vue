package com.example.member.api;/**
 * @title: MemberServiceImp
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2518:49
 */

import com.example.api.MemberServiceApi;
import com.example.domin.DO.UserEntityDO;
import com.example.domin.DTO.UserDTOOutput;
import com.example.member.mapper.UserMapper;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponseStruct;
import com.example.global.util.constants.Constants;
import com.example.global.util.objectTransform.ObjectTransform;
import com.example.global.util.tokenGenerate.TokenGenerate;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/25
 */
@RestController
public class MemberServiceImpl extends BaseApiService<UserDTOOutput> implements MemberServiceApi {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private TokenGenerate tokenGenerate;

    @Override
    public BaseResponseStruct<UserDTOOutput> existMobile(String mobile) {
        // 1.根据手机号码查询用户信息
        UserEntityDO userEntityDO = userMapper.existMobile(mobile);
        if (userEntityDO == null) {
            return setResultError(Constants.HTTP_RES_CODE_EXISTMOBILE_203, "用户信息不存在!");
        }
        UserDTOOutput userDTOOutput = ObjectTransform.transform(userEntityDO, UserDTOOutput.class);
        // 2.将do转换成dto
        return setResultSuccess(userDTOOutput);
    }

    @Override
    public BaseResponseStruct<UserDTOOutput> getInfo(String token) {
        // 1.验证token参数
        if (StringUtils.isEmpty(token)) {
            return setResultError("token不能为空!");
        }
        // 2.使用token查询redis 中的userId
        String redisUserId = tokenGenerate.getToken(token);
        if (StringUtils.isEmpty(redisUserId)) {
            return setResultError("token已经失效或者token错误!");
        }
        // 3.使用userID查询 数据库用户信息
        Long userId = Long.parseLong(redisUserId);
        UserEntityDO userEntityDO = userMapper.findByUserId(userId);
        if (userEntityDO == null) {
            return setResultError("用户不存在!");
        }
        UserDTOOutput userDTOOutput = ObjectTransform.transform(userEntityDO, UserDTOOutput.class);
        return setResultSuccess(userDTOOutput);
    }

}
