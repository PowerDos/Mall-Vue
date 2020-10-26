package com.example.global.util.redis;

import java.util.concurrent.TimeUnit;

import com.example.global.util.snowFlake.SnowFlakeIdUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

@Component
public class RedisUtil {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 返回redis中是否存在这个键并更新
     *
     * @param key     待查询键
     * @param value   值
     * @param timeout 超时时间
     * @return true：不存在且已经设置 false：存在且已经更新超时时间
     */
    public Boolean setNx(String key, String value, Long timeout) {
        Boolean setIfPresent = stringRedisTemplate.opsForValue().setIfPresent(key, value);
        if (timeout != null) {
            stringRedisTemplate.expire(key, timeout, TimeUnit.SECONDS);
        }
        return setIfPresent;
    }

    /**
     * 存放string类型
     *
     * @param key     key
     * @param data    数据
     * @param timeout 超时间
     */
    public void setString(String key, String data, Long timeout) {
        stringRedisTemplate.opsForValue().set(key, data, timeout, TimeUnit.SECONDS);
    }

    /**
     * 根据key查询string类型
     *
     * @param key
     * @return
     */
    public String getString(String key) {
        return stringRedisTemplate.opsForValue().get(key);
    }

    /**
     * 根据对应的key删除key
     *
     * @param key
     */
    public Boolean delKey(String key) {
        return stringRedisTemplate.delete(key);
    }


    public void expire(String key, Long timeout) {
        stringRedisTemplate.expire(key, timeout, TimeUnit.SECONDS);
    }

}
