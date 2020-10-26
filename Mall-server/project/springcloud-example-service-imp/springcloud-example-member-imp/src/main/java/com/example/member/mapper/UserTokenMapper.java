package com.example.member.mapper;

import com.example.entitity.DO.UserTokenDo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserTokenMapper {


	@Select("SELECT *  FROM example_user_token WHERE user_id=#{userId} AND login_type=#{loginType} and disable ='0'; ")
	UserTokenDo selectByUserIdAndLoginType(@Param("userId") Long userId, @Param("loginType") String loginType);


	@Update("update example_user_token set disable  ='1', update_time=now() where token=#{token}")
	int disableToken(@Param("token") String token);


	@Insert("INSERT INTO example_user_token VALUES (null, #{token},#{loginType}, #{deviceInfo}, #{ipInfo}, 0, #{userId} ,now(),null ); ")
	int insertUserToken(UserTokenDo userTokenDo);

	@Select("select * from example_user_token where token = #{token}")
	UserTokenDo queryLoginInfo(@Param("token") String token);

	@Select("select * from example_user_token where login_type = #{loginType} and user_id = #{userId} and disable = '0'")
	UserTokenDo queryLoginInfoByLoginTypeAndUserId(@Param("loginType")String loginType,@Param("userId")Long userId);
}
