package com.example.mallcommon.lazyload.propertyholder;


/**
 * 属性持有者
 *
 * @param <T> 期望的属性类型
 */
public interface LazyPropertyHolder<T> {

    /**
     * 获取持有的属性
     *
     * @return Object
     */
    Object getInstance();
}
