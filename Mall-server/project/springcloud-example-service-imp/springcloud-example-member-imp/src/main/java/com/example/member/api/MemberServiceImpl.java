package com.example.member.api;/**
 * @title: MemberServiceImp
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2518:49
 */

import com.example.api.MemberService;
import com.example.entitity.DO.UserEntityDO;
import com.example.entitity.DTO.UserDTOOutput;
import com.example.member.mapper.UserMapper;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
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
public class MemberServiceImpl extends BaseApiService<UserDTOOutput> implements MemberService {
  @Autowired
  private UserMapper userMapper;
  @Autowired
  private TokenGenerate tokenGenerate;

  @Override
  public BaseResponse<UserDTOOutput> existMobile(String mobile) {
    // 1.根据手机号码查询用户信息 单独定义code 表示是用户信息不存在把
    UserEntityDO userEntityDO = userMapper.existMobile(mobile);
    if (userEntityDO == null) {
      return setResultError(Constants.HTTP_RES_CODE_EXISTMOBILE_203, "用户信息不存在!");
    }
    UserDTOOutput userDTOOutput = ObjectTransform.doToDto(userEntityDO, UserDTOOutput.class);
    // 2.将do转换成dto
    return setResultSuccess(userDTOOutput);
  }

  @Override
  public BaseResponse<UserDTOOutput> getInfo(String token) {
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
    UserDTOOutput userDTOOutput = ObjectTransform.doToDto(userEntityDO, UserDTOOutput.class);
    // 下节课将 转换代码放入在BaseApiService
    return setResultSuccess(userDTOOutput);
  }
  // token存放在PC端 cookie token 存放在安卓 或者IOS端 存放在本地文件中
  // 当前存在那些问题？ 用户如果退出或者修改密码、忘记密码的情况 对token状态进行标识
  // token 如何防止伪造 真正其实很难防御伪造 尽量实现在安全体系 xss 只能在一些某些业务模块上加上必须验证本人操作

}
