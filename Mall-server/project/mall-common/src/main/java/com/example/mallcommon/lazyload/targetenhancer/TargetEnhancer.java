package com.example.mallcommon.lazyload.targetenhancer;

import com.example.mallcommon.lazyload.interceptor.GetterInvokeInterceptor;

/**
 * 类型转型且增强容器，其中包含了方法增强器 {@code MethodInvokeListener} 与属性持有者 {@code LazyPropertyHolder}
 *
 * @see GetterInvokeInterceptor
 * @see com.example.mallcommon.lazyload.propertyholder.LazyPropertyHolder
 */
public interface TargetEnhancer {

    /**
     * 获取期望的对象
     * <P>对于每一个给定的source，都能将其转换成期望的 {@code T} 类型的对象</P>
     *
     * @param source 源对象
     * @param expectCls 期望的Class类型
     * @param <T> 期望的类型
     * @return 增强后的目标对象
     */
    <S extends T,T> S getTarget(Object source,Class<T> expectCls);
}
