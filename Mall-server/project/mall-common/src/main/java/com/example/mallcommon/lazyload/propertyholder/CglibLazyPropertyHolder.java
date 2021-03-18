package com.example.mallcommon.lazyload.propertyholder;

import com.example.mallcommon.lazyload.listener.CglibLazyPropertyListener;
import org.springframework.cglib.proxy.Enhancer;

import java.util.List;

/**
 * 延迟加载某个属性的监听者
 *
 * <p>通过使用cglib动态代理的方式来对代理类的属性进行懒加载的监听</p>
 *
 * @param <T> 属性的期望类型
 */
public class CglibLazyPropertyHolder<T> implements LazyPropertyHolder<T> {


    private T instance;

    private CglibLazyPropertyListener lazyPropertyListener;

    public CglibLazyPropertyHolder(Object source, List<String> invokeMethodName) {
        this.lazyPropertyListener = new CglibLazyPropertyListener(source, invokeMethodName);
        System.out.println("instantiate property holder with method-invoke list:" + invokeMethodName + "\n");
        this.instance = holdInstance();
    }

    private T holdInstance() {
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(Object.class);
        enhancer.setCallback(lazyPropertyListener);
        return (T) enhancer.create();
    }

    public T getInstance() {
        return instance;
    }


}