package com.example.global.util.cache;

import com.example.global.util.redis.RedisUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.concurrent.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @description: 二级redis缓存
 * @author: WuHao
 * @time: 2020/6/18 15:24
 */
@Service
@Slf4j
public class SecondCache extends FirstCacheDecorator {
    private final ExecutorService threadPool = new ThreadPoolExecutor(2, 30,
            30L, TimeUnit.SECONDS,
           new ArrayBlockingQueue<>(20), new ThreadPoolExecutor.DiscardPolicy());

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private FirstCache firstCache;

    SecondCache(FirstCache firstCache) {
        super(firstCache);
    }

    @Override
    public void saveCache(String key, String value) {
        threadPool.execute(new Runnable() {
            @Override
            public void run() {
                saveCacheToRedisCache(key, value);
                firstCache.saveCache(key, value);
            }
        });
    }

    @Override
    public String loadCache(String key) {
        String cacheStr = firstCache.loadCache(key);
        if (cacheStr == null) {
            cacheStr = loadCacheFromRedisCache(key);
            // 本地缓存穿透，redis中找到，将redis结果缓存到本地
            if (cacheStr != null) {
                firstCache.saveCache(key, cacheStr.toString());
            }
        }
        return cacheStr;
    }

    public void saveCacheToRedisCache(String key, String value) {
        redisUtil.setString(key, value, 60L);
        log.info("--------缓存至redis:{}", value);
    }

    public String loadCacheFromRedisCache(String key) {
        String result = redisUtil.getString(key);
        if (result != null) {
            log.info("--------从redis读取缓存:{}", result);
            // 消除json字符串的转义
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(result);
            result = m.replaceAll("");
        }
        return result;
    }

}
