package com.example.global.util.cache;

/**
 * @description: 缓存接口
 * @author: WuHao
 * @time: 2020/6/18 15:27
 */
public interface ICache {

    void saveCache(String key, String value);

    String loadCache(String key);
}
