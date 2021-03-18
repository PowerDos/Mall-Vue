package com.example.mallcommon.lazyload.listener;

import com.example.mallcommon.lazyload.Convert;
import com.example.mallcommon.lazyload.LazyProperty;
import com.example.mallcommon.lazyload.propertyholder.LazyPropertyHolder;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Map;

/**
 * Cglib方法增强器的具体实现类
 */
public class CglibMethodInvokeListener implements MethodInvokeListener {

    /**
     * 所有source对象中有的属性
     *
     * @see LazyProperty
     */
    private Map<String, LazyProperty> propertyMap;


    public void addInterceptor(Map<String, LazyProperty> propertyMap) {
        this.propertyMap = propertyMap;
    }


    /**
     * 在此拦截target的getter，并判断是否需要做增强
     *
     * @param o           调用method的对象
     * @param method      调用的method
     * @param objects     参数
     * @param methodProxy 方法代理
     * @return method调用结果
     * @throws Throwable TODO:具体异常类型
     */
    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
        String methodName = method.getName();
        if (!methodName.startsWith("get")) {
            return methodProxy.invokeSuper(o, objects);
        }
        // 该方法可能需要加载的参数名
        String guessFieldName = methodName.substring(3, 4).toLowerCase() + methodName.substring(4);

        Object o1 = loadProperty(o, guessFieldName);
        return o1 == null ? methodProxy.invokeSuper(o, objects) : o1;
    }

    public Object loadProperty(Object o, String guessFieldName) throws Exception {
        //1.该方法需要的就是source的数据
        if (propertyMap.containsKey(guessFieldName)) {
            LazyProperty lazyProperty = propertyMap.get(guessFieldName);
            LazyPropertyHolder<?> lazyPropertyHolder = lazyProperty.lazyPropertyHolder;
            Object requireObj = lazyPropertyHolder.getInstance();
            // 这里需要显式的调用一下requireObj以触发cglib的懒加载。。
            requireObj.hashCode();
            Field cglib$LAZY_loader_0 = requireObj.getClass().getDeclaredField("CGLIB$LAZY_LOADER_0");
            cglib$LAZY_loader_0.setAccessible(true);
            requireObj = cglib$LAZY_loader_0.get(requireObj);
            // 将requireObj装换成需要的类型
            Class<?> targetCls = o.getClass();
            if (targetCls.equals(Object.class)) {
                targetCls = targetCls.getSuperclass();
            }
            Field declaredField = targetCls.getDeclaredField(guessFieldName);
            Object convert = Convert.convert(requireObj, declaredField);
            return convert;
        }

        //2.该方法加载的对象需要source的数据
        // unchecked
        Field requireField = o.getClass().getSuperclass().getDeclaredField(guessFieldName);
        Class<?> requireType = requireField.getType();
        Object requireObj = requireType.newInstance();
        Field[] containFields = requireType.getDeclaredFields();
        boolean loaded = false; // 该方法加载的数据根source数据无关
        for (Field field : containFields) {
            Object requireFieldVal = loadProperty(requireObj, field.getName());
            field.setAccessible(true);
            field.set(requireObj, requireFieldVal);
            loaded = true;
        }
        return loaded ? requireObj : null;

    }
}