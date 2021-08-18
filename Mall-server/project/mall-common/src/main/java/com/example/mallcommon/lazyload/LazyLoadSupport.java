package com.example.mallcommon.lazyload;

import java.lang.reflect.Field;
import java.util.Date;
import java.util.List;

/**
 * 作为延迟传递加载功能的一些工具类
 *
 * <p>作为延迟传递加载功能的一些工具类</p>
 *
 * @author WuHao
 * @since 2021/3/18 13:11
 */
public class LazyLoadSupport {
    public static String getGetterName(Field field) {
        return "get" + field.getName().substring(0, 1).toUpperCase() + field.getName().substring(1);
    }

    /**
     * 对应type是一个简单java.lang对象
     *
     * @param type 待检验type类
     * @return true if type is a simple object import from java.lang
     */
    public static Boolean typeWhichRequireScanInnerField(Class<?> type) {
        return !type.equals(String.class) && !type.equals(Integer.class) && !type.equals(Long.class) && !type.equals(Boolean.class) &&
                !type.equals(Double.class) && !type.equals(Float.class) && !type.equals(Date.class) && !List.class.isAssignableFrom(type);
    }

    /**
     * 对应type是一个非List的简单java.util对象
     *
     * @param type 待检验type类
     * @return true if type is a simple object import from java.util except List.class
     */
    public static Boolean typeWhichIsSimpleObject(Class<?> type) {
        return type.equals(String.class) || type.equals(Integer.class) || type.equals(Long.class) || type.equals(Boolean.class) ||
                type.equals(Double.class) || type.equals(Float.class) || type.equals(Date.class);
    }

    public static String getGuessFieldName(String methodName) {
        int index = methodName.indexOf("get");
        return methodName.substring(index + 3, index + 4).toLowerCase() + methodName.substring(index + 4);
    }
}
