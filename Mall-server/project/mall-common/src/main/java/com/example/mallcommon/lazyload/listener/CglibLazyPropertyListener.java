package com.example.mallcommon.lazyload.listener;

import org.springframework.cglib.proxy.LazyLoader;

import java.lang.reflect.Method;
import java.util.List;

/**
 * Cglib 属性监听器
 *
 * <p>当实际加载被注册的属性时，会去依次调用方法 {@code invokeMethodNameArray} 尝试加载</p>
 *
 * @author WuHao
 * @since 2021/3/17 15:16
 */
public class CglibLazyPropertyListener implements LazyLoader {

    private Object source;

    private List<String> invokeMethodNameArray;

    public CglibLazyPropertyListener(Object source, List<String> invokeMethodName) {
        this.source = source;
        this.invokeMethodNameArray = invokeMethodName;
    }

    @Override
    public Object loadObject() throws Exception {
        System.out.println("start to load property with method-invoke list" + invokeMethodNameArray + "to load property...\n");
        Object invoke = source;
        for (String methodName : invokeMethodNameArray) {
            Method declaredMethod = invoke.getClass().getDeclaredMethod(methodName);
            declaredMethod.setAccessible(true);
            invoke = declaredMethod.invoke(invoke);
        }
        return invoke;
    }
}
