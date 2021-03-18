package com.example.mallcommon.lazyload.container;

import com.example.mallcommon.lazyload.LazyLoadSupport;
import com.example.mallcommon.lazyload.LazyProperty;
import com.example.mallcommon.lazyload.listener.MethodInvokeListener;
import com.example.mallcommon.lazyload.propertyholder.CglibLazyPropertyHolder;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

/**
 * 适用于mybatis的具体实现类
 *
 * <p>主要的区别就是mybatis采用了cglib对属性进行懒加载，需要拦截其代理对象的方法</p>
 *
 * @param <T> 期望的目标代理对象类型
 * @author WuHao
 * @since 2021/3/12 11:51
 */
public class MybatisTargetEnhancer<T> extends AbstractTargetEnhancer<T> {

    @Autowired
    private MethodInvokeListener methodInvokeListener;

    /**
     * 配置所有source中包含的属性,这其中的每一个属性都属orm数据库框架加载的最小粒度
     */
    @Override
    protected Map<String, LazyProperty> getAllRequireLazyLoadProperties() {
        Map<String, LazyProperty> lazyProperties = new LinkedHashMap<>();
        Class<?> proxyCls = proxySource.getClass();
        Class<?> sourceCls = (Class<?>) proxySource.getClass().getGenericSuperclass();
        if (sourceCls == Object.class) {  // Mybatis 直接加载完毕的对象父类是Object(这里要求我们的PO不会继承于其他类)
            sourceCls = proxyCls;
        }
        // Mybatis 懒加载对象
        Method[] proxyDeclaredMethods = proxyCls.getDeclaredMethods();
        for (Method method : proxyDeclaredMethods) {
            String proxyMethodName = method.getName();
            if (proxyMethodName.startsWith("get")) {
                String guessFieldName = LazyLoadSupport.getGuessFieldName(proxyMethodName);
                try {
                    Field declaredField = sourceCls.getDeclaredField(guessFieldName);
                    createLazyPropertyByField(lazyProperties, declaredField, null);
                } catch (Exception e) {
                    // wrong guess
                }
                // wrong guess
            }
        }

        return lazyProperties;
    }

    private void createLazyPropertyByField(Map<String, LazyProperty> lazyProperties, Field declaredField, String appendMethodName) throws Exception {
        Class<?> type = declaredField.getType();
        // 无需进入source内部对象
        if (!LazyLoadSupport.typeWhichRequireScanInnerField(type)) {
            String guessMethodName = LazyLoadSupport.getGetterName(declaredField);
            List<String> invokeMethodNameList = new ArrayList<>();
            if (appendMethodName != null) {
                invokeMethodNameList.add(appendMethodName);
            }
            invokeMethodNameList.add(guessMethodName);
            LazyProperty lazyProperty = new LazyProperty();
            lazyProperty.lazyPropertyHolder = new CglibLazyPropertyHolder<>(proxySource, invokeMethodNameList);
            lazyProperties.put(declaredField.getName(), lazyProperty);
        } else {
            // 这是一个对象，需要递归获取其中可用的属性值
            Field[] innerFields = type.getDeclaredFields();
            for (Field field : innerFields) {
                String guessMethodName = LazyLoadSupport.getGetterName(declaredField);
                createLazyPropertyByField(lazyProperties, field, guessMethodName);
            }
        }
    }

    /**
     * 给子类一个重写父类的加载方法增强器的机会
     *
     * @return MethodInvokeListener 方法增强器
     */
    @Override
    protected MethodInvokeListener configInterceptor() {
        methodInvokeListener.addInterceptor(lazyProperties);
        return methodInvokeListener;
    }


}
