package com.example.mallcommon.lazyload;

import com.example.mallcommon.lazyload.listener.InvokeListener;
import com.example.mallcommon.lazyload.property.PropertyLazyLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.proxy.Enhancer;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * 用于存放转换后生成的目标代理对象以及各种listener的抽象类
 *
 * <p> </p>
 *
 * @param <T> 期望的目标代理对象类型
 * @author WuHao
 * @since 2021/3/12 11:51
 */
public class TargetEnhancerContainer<T> {

    private Class<?> expectCls;
    protected Object source;
    protected List<LazyProperty> lazyPropertyList;

    @Autowired
    private InvokeListener invokeListener;

    public void initialize(Object source, Class<?> expectCls) {
        this.expectCls = expectCls;
        this.source = source;
        configProperties();
        invokeListener.addInterceptor(lazyPropertyList, expectCls);
        for (LazyProperty lazyProperty : lazyPropertyList) {
            lazyProperty.lazyPropertyHolder = new PropertyLazyLoader<>(source, lazyProperty.method);
        }
    }


    public void addIgnoreLazyProperty() throws Exception {
        // TODO
        throw new Exception("TODO!");
    }

    public T getTarget() {
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(expectCls);
        enhancer.setCallback(invokeListener);
        return (T) enhancer.create();
    }

    /**
     * 配置所有source中包含的属性
     */
    private void configProperties() {
        Class<?> proxyCls = source.getClass();
        Class<?> sourceCls = (Class<?>) source.getClass().getGenericSuperclass();

        Method[] declaredMethods = proxyCls.getDeclaredMethods();
        lazyPropertyList = new ArrayList<>();
        for (Method method : declaredMethods) {
            String methodName = method.getName();
            String testMethodName = methodName.substring(1);// 只取代理对象的代理method
            if (testMethodName.contains("get")) {
                int index = testMethodName.indexOf("get");
                String newMethodName = testMethodName.substring(index);
                String guessFieldName = testMethodName.substring(index + 3, index + 4).toLowerCase() + testMethodName.substring(index + 4);
                try {
                    Field targetField = sourceCls.getDeclaredField(guessFieldName);

                    LazyProperty lazyProperty = new LazyProperty();
                    lazyProperty.methodName = methodName;
                    lazyProperty.method = method;
                    lazyPropertyList.add(lazyProperty);
                } catch (NoSuchFieldException e) {
//                    e.printStackTrace();
                    // wrong guess
                }
                // wrong guess
            }
        }
    }


}
