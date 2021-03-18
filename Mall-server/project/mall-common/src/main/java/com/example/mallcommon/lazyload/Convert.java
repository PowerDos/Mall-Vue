package com.example.mallcommon.lazyload;


import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;

/**
 * 属性拷贝类
 *
 * <p>将source对象转换成field的Class的对象</p>
 *
 * @author WuHao
 * @since 2021/3/15 17:13
 */
public class Convert {

    /**
     * 会根据source中fieldName来对target中的同名field进行填充
     *
     * @param source 源对象
     * @param field  目标field(使用field而不是用Class<?>是因为要获得field可能携带的泛型)
     * @return 目标对象
     * @throws Exception 转换失败
     */
    public static Object convert(Object source, Field field) throws Exception {
        // 首先判断是否是List类型
        if (List.class.isAssignableFrom(field.getType())) {
            List<Object> result = new ArrayList<>();
            // 获取List的泛型
            Class<?> T = (Class<?>) ((ParameterizedType) field.getGenericType()).getActualTypeArguments()[0];
            if (source instanceof List) {
                for (Object object : (List<?>) source) {
                    Object listVal = T.newInstance();
                    for (Field innerField : T.getDeclaredFields()) {
                        String guessMethodName = LazyLoadSupport.getGetterName(innerField);
                        Method sourceMethod = object.getClass().getDeclaredMethod(guessMethodName);
                        sourceMethod.setAccessible(true);
                        Object innerSource = sourceMethod.invoke(object);
                        Object data = convert(innerSource, innerField);
                        innerField.setAccessible(true);
                        innerField.set(listVal, data);
                    }
                    result.add(listVal);
                }
                return result;
            } else {
                throw new Exception("targetField is a List while source class is not!");
            }
        }

        if (LazyLoadSupport.typeWhichIsSimpleObject(field.getType())) {
            return source;
        }

        // 如果目标Field是普通对象
        Object instance = field.getType().newInstance();
        Field[] fields = field.getType().getDeclaredFields();
        for (Field innerField : fields) {
            String guessMethodName = LazyLoadSupport.getGetterName(innerField);
            Method sourceMethod = source.getClass().getDeclaredMethod(guessMethodName);
            sourceMethod.setAccessible(true);
            Object innerSource = sourceMethod.invoke(source);
            Object data = convert(innerSource, innerField);
            innerField.setAccessible(true);
            innerField.set(instance, data);
        }
        return instance;
    }
}
