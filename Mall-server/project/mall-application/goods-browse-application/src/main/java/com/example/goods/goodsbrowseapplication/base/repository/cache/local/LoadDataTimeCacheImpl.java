package com.example.goods.goodsbrowseapplication.base.repository.cache.local;

import com.example.mallcommon.loadcontroller.LoadDataTimeCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.stereotype.Repository;



/**
 * 加载时间缓存管理
 *
 * <p>加载时间缓存管理</p>
 *
 * @author WuHao
 * @since 2021/3/24 13:36
 */
@Repository
public class LoadDataTimeCacheImpl implements LoadDataTimeCache {


    @Autowired
    private CacheManager cacheManager;


    @Override
    public void setLoadDataTime(String key, Long time) throws Exception {
        Cache cache = cacheManager.getCache("loadDataTimeCache");
        if (cache == null) throw new Exception("Illegal CacheName!");
        cache.put(key, time);
    }

    @Override
    public Long getLoadDataTime(String key) throws Exception {
        Cache cache = cacheManager.getCache("loadDataTimeCache");
        if (cache == null) throw new Exception("Illegal CacheName!");
        return cache.get(key, Long.class);
    }
}
