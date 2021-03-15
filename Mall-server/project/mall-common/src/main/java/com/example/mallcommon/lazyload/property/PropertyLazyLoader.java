package com.example.mallcommon.lazyload.property;

import org.springframework.beans.BeanUtils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * 延迟加载某个属性的监听者
 *
 * <p>通过使用cglib动态代理的方式来对代理类的属性进行懒加载的监听</p>
 *
 * @param <T> 属性的期望类型
 */
public class PropertyLazyLoader<T> implements LazyPropertyHolder<T> {

    private Object source;

    private Method method;

    public PropertyLazyLoader(Object source, Method method) {
        this.source = source;
        this.method = method;
    }

    @Override
    public T loadObject() throws Exception {
//        System.out.println("start to invoke method(" + method.getName() + ") to load property...");
        method.setAccessible(true);
        Object invoke = method.invoke(source);
        return (T) invoke;
    }

    @Override
    public void initialize(Object source, Field targetField) {

    }
}