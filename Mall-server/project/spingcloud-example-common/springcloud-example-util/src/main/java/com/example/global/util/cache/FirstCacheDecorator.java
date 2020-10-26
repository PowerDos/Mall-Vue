package com.example.global.util.cache;

/**
 * @description: 一级缓存装饰类
 * @author: WuHao
 * @time: 2020/6/18 15:44
 */
public abstract class FirstCacheDecorator implements ICache {

    protected FirstCache firstCache;

    FirstCacheDecorator(FirstCache firstCache) {
        this.firstCache = firstCache;
    }

    public void saveCache(String key, String value) {
        firstCache.saveCache(key, value);
    }

    public String loadCache(String key) {
        return firstCache.loadCache(key);
    }


}
