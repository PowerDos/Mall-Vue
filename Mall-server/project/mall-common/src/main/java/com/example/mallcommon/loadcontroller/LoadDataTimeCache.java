package com.example.mallcommon.loadcontroller;



public interface LoadDataTimeCache {

    /**
     * 保存加载数据的时间
     *
     * @param key  缓存key
     * @param time 加载耗时
     */
    void setLoadDataTime(String key, Long time) throws Exception;

    /**
     * 获取加载数据耗时
     *
     * @param key 缓存key
     * @return 加载耗时
     */
     Long getLoadDataTime(String key) throws Exception;
}
