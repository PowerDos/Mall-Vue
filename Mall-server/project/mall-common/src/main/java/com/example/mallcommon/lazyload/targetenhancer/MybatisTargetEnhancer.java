package com.example.mallcommon.lazyload.targetenhancer;

import com.example.mallcommon.lazyload.LazyLoadSupport;
import com.example.mallcommon.lazyload.interceptor.GetterInvokeInterceptor;
import com.example.mallcommon.lazyload.propertyholder.CglibLazyPropertyHolder;
import com.example.mallcommon.lazyload.propertyholder.LazyPropertyHolder;
import org.springframework.beans.factory.annotation.Autowired;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

/**
 * 适用于mybatis的具体实现类
 *
 * <p>主要的区别就是mybatis采用了cglib对属性进行懒加载，需要拦截其代理对象的方法</p>
 *
 * @author WuHao
 * @since 2021/3/12 11:51
 */
public class MybatisTargetEnhancer extends AbstractTargetEnhancer {

    @Autowired
    private GetterInvokeInterceptor getterInvokeInterceptor;

    /**
     * 配置所有source中包含的属性,这其中的每一个属性都是orm数据库框架加载的最小粒度
     */
    @Override
    protected Map<String, LazyPropertyHolder<?>> getAllRequireLazyLoadProperties() {
        Map<String, LazyPropertyHolder<?>> lazyProperties = new LinkedHashMap<>();
        Class<?> proxyCls = proxySource.getClass();
        Class<?> sourceCls; // PO类
        if (proxyCls.getName().contains(proxyCls.getSuperclass().getName())) { // 这个是mybatis生成的延迟加载cglib代理对象
            sourceCls = proxyCls.getSuperclass();
        } else { // 这个是mybatis直接映射的结果集对象
            sourceCls = proxySource.getClass();
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

    /**
     * 对于可能的field构建它的延迟加载的引用对象
     * @param lazyProperties 所有懒加载的属性集合
     * @param declaredField 需要懒加载的field
     * @param appendMethodName 这个field的getter方法名
     */
    private void createLazyPropertyByField(Map<String, LazyPropertyHolder<?>> lazyProperties, Field declaredField, String appendMethodName)  {
        Class<?> type = declaredField.getType();
        // 无需进入source内部对象
        if (!LazyLoadSupport.typeWhichRequireScanInnerField(type)) {
            String guessMethodName = LazyLoadSupport.getGetterName(declaredField);
            List<String> invokeMethodNameList = new ArrayList<>();
            if (appendMethodName != null) {
                invokeMethodNameList.add(appendMethodName);
            }
            invokeMethodNameList.add(guessMethodName);
            lazyProperties.put(declaredField.getName(), new CglibLazyPropertyHolder<>(proxySource, invokeMethodNameList));
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
    protected GetterInvokeInterceptor configInterceptor() {
        getterInvokeInterceptor.addInterceptor(lazyProperties);
        return getterInvokeInterceptor;
    }


}
