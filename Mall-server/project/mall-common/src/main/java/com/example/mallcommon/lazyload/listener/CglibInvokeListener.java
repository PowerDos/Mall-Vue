package com.example.mallcommon.lazyload.listener;

import com.example.mallcommon.lazyload.Convert;
import com.example.mallcommon.lazyload.LazyProperty;
import org.springframework.beans.BeanUtils;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CglibInvokeListener implements InvokeListener {

    /**
     * 所有source对象中有的属性
     *
     * @see LazyProperty
     */
    private Map<String, LazyProperty> propertyMap;


    public void addInterceptor(Map<String, LazyProperty> propertyMap, Class<?> exceptCls) {
        this.propertyMap = propertyMap;
    }


    /**
     * 在此拦截target的getter，并判断是否需要做增强
     *
     * @param o
     * @param method
     * @param objects
     * @param methodProxy
     * @return
     * @throws Throwable
     */
    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
        String methodName = method.getName();
        if (!methodName.startsWith("get")) {
            return methodProxy.invokeSuper(o, objects);
        }
        // 该方法可能需要加载的参数名
        String guessFieldName = methodName.substring(3, 4).toLowerCase() + methodName.substring(4);

        //1.该方法需要的就是source的数据
        if (propertyMap.containsKey(guessFieldName)) {
            System.out.println("需要拦截！" + guessFieldName);
            LazyProperty lazyProperty = propertyMap.get(guessFieldName);
            Object requireObj = lazyProperty.lazyPropertyHolder.loadObject();
            // 将requireObj装换成需要的类型
            Field declaredField = ((Class<?>) o.getClass().getGenericSuperclass()).getDeclaredField(guessFieldName);
            return Convert.convert(requireObj, declaredField);
        }

        //2.该方法加载的对象需要source的数据（目前仅递进一层）
        Class<?> returnType = method.getReturnType();
        Field[] containFields = returnType.getDeclaredFields();
        List<String> containFieldsName = new ArrayList<>();
        for (Field field : containFields) {
            containFieldsName.add(field.getName());
        }
        List<String> allNeedToLoadFieldNameList = new ArrayList<>();
        for (String existFieldName : propertyMap.keySet()) {
            if (containFieldsName.contains(existFieldName)) {
                allNeedToLoadFieldNameList.add(existFieldName);
            }
        }
        if (!allNeedToLoadFieldNameList.isEmpty()) {
            System.out.println("需要拦截！" + guessFieldName);
            Object returnTypeObj = returnType.newInstance();
            for (String fieldName : allNeedToLoadFieldNameList) {
                Field requireField = returnType.getDeclaredField(fieldName);
                requireField.setAccessible(true);
                Object property = propertyMap.get(fieldName).lazyPropertyHolder.loadObject();
                requireField.set(returnTypeObj, property);
            }
            return returnTypeObj;
        }
        return methodProxy.invokeSuper(o, objects);
    }
}