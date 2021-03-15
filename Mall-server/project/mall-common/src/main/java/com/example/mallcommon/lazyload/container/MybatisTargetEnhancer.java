package com.example.mallcommon.lazyload.container;

import com.example.mallcommon.lazyload.LazyProperty;
import com.example.mallcommon.lazyload.listener.InvokeListener;
import com.example.mallcommon.lazyload.property.PropertyLazyLoader;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

/**
 * 用于存放转换后生成的目标代理对象以及各种listener的抽象类
 *
 * <p> </p>
 *
 * @param <T> 期望的目标代理对象类型
 * @author WuHao
 * @since 2021/3/12 11:51
 */
public class MybatisTargetEnhancer<T> extends AbstractTargetEnhancer<T> {

    @Autowired
    private InvokeListener invokeListener;


    public void addIgnoreLazyProperty() throws Exception {
        throw new Exception("TODO!");
    }

    /**
     * 配置所有source中包含的属性
     */
//    @Override
    protected Map<String, LazyProperty> configProperties() {
        Map<String, LazyProperty> lazyProperties = new LinkedHashMap<>();
        Class<?> proxyCls = proxySource.getClass();
        Class<?> sourceCls = (Class<?>) proxySource.getClass().getGenericSuperclass();
        if (sourceCls == Object.class) {
            // Mybatis 直接加载完毕的对象
            sourceCls = proxyCls;
            Method[] proxyDeclaredMethods = proxyCls.getDeclaredMethods();
            for (Method method : proxyDeclaredMethods) {
                String proxyMethodName = method.getName();
                if (proxyMethodName.startsWith("get")) {// 只取代理对象的代理method @$$XXX_getXXX
                    String guessFieldName = proxyMethodName.substring(3, 4).toLowerCase() + proxyMethodName.substring(4);
                    try {
                        Field declaredField = sourceCls.getDeclaredField(guessFieldName);
                        LazyProperty lazyProperty = new LazyProperty();
                        if (List.class.isAssignableFrom(declaredField.getType())) {
                            lazyProperty.listType = Object.class;
                        }
                        lazyProperty.lazyPropertyHolder = new PropertyLazyLoader<>(proxySource, method);
                        lazyProperties.put(guessFieldName, lazyProperty);
                    } catch (NoSuchFieldException e) {
                        // wrong guess
                    }
                    // wrong guess
                }
            }
        } else {
            // Mybatis 懒加载对象
            Method[] proxyDeclaredMethods = proxyCls.getDeclaredMethods();
            for (Method method : proxyDeclaredMethods) {
                String proxyMethodName = method.getName();
                if (!proxyMethodName.startsWith("get") && proxyMethodName.contains("get")) {// 只取代理对象的代理method @$$XXX_getXXX
                    int index = proxyMethodName.indexOf("get");
                    String guessFieldName = proxyMethodName.substring(index + 3, index + 4).toLowerCase() + proxyMethodName.substring(index + 4);
                    try {
                        Field declaredField = sourceCls.getDeclaredField(guessFieldName);
                        LazyProperty lazyProperty = new LazyProperty();
                        lazyProperty.lazyPropertyHolder = new PropertyLazyLoader<>(proxySource, method);
                        lazyProperties.put(guessFieldName, lazyProperty);
                    } catch (NoSuchFieldException e) {
                        // wrong guess
                    }
                    // wrong guess
                }
            }
        }
        return lazyProperties;
    }

    @Override
    protected InvokeListener configInterceptor() {
        invokeListener.addInterceptor(lazyProperties, expectCls);
        return invokeListener;
    }


}
