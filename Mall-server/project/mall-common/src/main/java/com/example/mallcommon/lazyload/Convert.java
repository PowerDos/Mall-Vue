package com.example.mallcommon.lazyload;

import java.lang.reflect.Field;

/**
 * 深度拷贝类
 *
 * <p>深度拷贝类</p>
 *
 * @author WuHao
 * @since 2021/3/15 17:13
 */
public class Convert {

    public static Object convert(Object source, Field field) {
        System.out.println("!!!");

        //TODO 这里需要将source对象转换成field的Class的对象(注意需要同时转换source对象中的子对象，集合的泛型等)
        return null;
    }

    //            if (requireObj instanceof List<?> && lazyProperty.listType != null) {
//                List<Object> list = new ArrayList<>();
//                // 判断该方法返回的集合的泛型
//                Field declaredField = ((Class<?>) o.getClass().getGenericSuperclass()).getDeclaredField(guessFieldName);
//                Type genericType = declaredField.getGenericType();
//                if (genericType instanceof ParameterizedType) {
//                    Type actualTypeArgument = ((ParameterizedType) genericType).getActualTypeArguments()[0];
//                    Class<?> actualTypeArgument1 = (Class<?>) actualTypeArgument;
//                    ((List<?>) requireObj).forEach(data -> {
//                        try {
//                            Object listContent = actualTypeArgument1.newInstance();
//                            BeanUtils.copyProperties(data, listContent);
//                            list.add(listContent);
//                        } catch (InstantiationException | IllegalAccessException e) {
//                            e.printStackTrace();
//                        }
//                    });
//                }
//                requireObj = list;
//                System.out.println("!@#!!@#");
//            }
}
