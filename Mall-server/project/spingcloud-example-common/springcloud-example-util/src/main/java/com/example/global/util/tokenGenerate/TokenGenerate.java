package com.example.global.util.tokenGenerate;

import com.example.global.util.redis.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.UUID;

@Component
public class TokenGenerate {
    @Autowired
    private RedisUtil redisUtil;

    /**
     * 生成令牌
     *
     * @param keyPrefix  令牌key前缀
     * @param redisValue redis存放的值
     * @return 返回token
     */
    public String createToken(String keyPrefix, String redisValue) {
        return createToken(keyPrefix, redisValue, null);
    }

    /**
     * 生成令牌
     *
     * @param keyPrefix  令牌key前缀
     * @param redisValue redis存放的值
     * @param time       有效期
     * @return 返回token
     */
    public String createToken(String keyPrefix, String redisValue, Long time) {
        if (StringUtils.isEmpty(redisValue)) {
            new Exception("redisValue Not null");
        }
        String token = keyPrefix + UUID.randomUUID().toString().replace("-", "");
        redisUtil.setString(token, redisValue, time);
        return token;
    }

    /**
     * 延期令牌
     *
     * @param key  令牌key
     * @param timeout  有效期
     */
    public void expireToken(String key, Long timeout) {
        redisUtil.expire(key,timeout);
    }

    /**
     * 生成令牌
     *
     * @param key        令牌key
     * @param redisValue redis存放的值
     * @param time       有效期
     * @return 返回token
     */
    public void createTokenWithNoSuffix(String key, String redisValue, Long time) {
        if (StringUtils.isEmpty(redisValue)) {
            new Exception("redisValue Not null");
        }
        redisUtil.setString(key, redisValue, time);
    }


    /**
     * 更新令牌
     *
     * @param key        令牌key
     * @param redisValue redis存放的值
     * @param time       有效期
     */
    public void updateToken(String key, String redisValue, Long time) {
        if (StringUtils.isEmpty(redisValue)) {
            new Exception("redisValue Not null");
        }
        redisUtil.setString(key, redisValue, time);
    }

    /**
     * 根据token获取redis中的value值
     *
     * @param token
     * @return
     */
    public String getToken(String token) {
        if (StringUtils.isEmpty(token)) {
            return null;
        }
        return redisUtil.getString(token);
    }

    /**
     * 移除token
     *
     * @param token
     * @return
     */
    public Boolean removeToken(String token) {
        if (StringUtils.isEmpty(token)) {
            return null;
        }
        return redisUtil.delKey(token);

    }

}

