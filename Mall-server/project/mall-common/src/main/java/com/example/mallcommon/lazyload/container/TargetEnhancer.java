package com.example.mallcommon.lazyload.container;

/**
 * 类型转型且增强容器，其中包含了方法增强器 {@code MethodInvokeListener} 与属性持有者 {@code LazyPropertyHolder}
 *
 * <P>对于每一个给定的source，都能将其转换成期望的 {@code T} 类型的对象</P>
 *
 * @param <T> 期望的对象类型
 * @see com.example.mallcommon.lazyload.listener.MethodInvokeListener
 * @see com.example.mallcommon.lazyload.propertyholder.LazyPropertyHolder
 */
public interface TargetEnhancer<T> {
    /**
     * 初始化一个转换增强器
     *
     * @param source    需要进行转换增强的原始对象
     * @param expectCls 期望的目标对象类型
     */
    void initialize(Object source, Class<?> expectCls);

    /**
     * 获取期望的对象
     *
     * @return 增强后的目标对象
     */
    T getTarget();
}
