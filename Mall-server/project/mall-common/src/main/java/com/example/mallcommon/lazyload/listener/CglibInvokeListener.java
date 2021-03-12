package com.example.mallcommon.lazyload.listener;

import com.example.mallcommon.lazyload.LazyProperty;
import com.example.mallcommon.lazyload.property.LazyPropertyHolder;
import org.springframework.cglib.proxy.MethodProxy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class CglibInvokeListener implements InvokeListener {

    /**
     * 所有source对象中有的属性
     * <methodName,fieldName>
     */
    private List<LazyProperty> propertyList;


    public void addInterceptor(List<LazyProperty> propertyList, Class<?> expectCls) {
        this.propertyList = propertyList;
    }


    @Override
    public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
        // TODO 决定是否去加载source的数据
        List<String> containFieldList = new ArrayList<>();
        propertyList.forEach(lazyProperty -> {
            int getIndex = lazyProperty.methodName.indexOf("get");
            String containFieldName = lazyProperty.methodName.substring(getIndex + 3, getIndex + 4).toLowerCase() + lazyProperty.methodName.substring(4);
            containFieldList.add(containFieldName);
        });

        String methodName = method.getName();
        if (methodName.startsWith("get")) {
            //1.该方法需要的就是source的数据
            String guessFieldName = methodName.substring(3, 4).toLowerCase() + methodName.substring(4);
            try {
                Field declaredField = o.getClass().getDeclaredField(guessFieldName);
                if (containFieldList.contains(declaredField.getName())) {
                    System.out.println("需要拦截！" + declaredField.getName());
                }
            } catch (NoSuchFieldException e) {
                // wrong guess
            }
            //2.该方法加载的对象需要source的数据(这里暂时只递进一层关系)
            Class<?> returnType = method.getReturnType();

            Field[] secField = returnType.getDeclaredFields();
            String innerFieldName = "";
            for (Field field : secField) {
                if (containFieldList.contains(field.getName())) {
                    innerFieldName = field.getName();
                }
            }
            if (!innerFieldName.equals("")) {
                System.out.println("需要拦截！" + methodName + "(" + innerFieldName + ")");
            }

        }


//        for (LazyProperty lazyProperty : propertyList) {
//            if (lazyProperty.methodName.equals(method.getName())) {
//                LazyPropertyHolder<?> lazyPropertyHolder = lazyProperty.lazyPropertyHolder;
//                if (lazyPropertyHolder == null) {
//                    // 无需懒加载
//                    System.out.println("无需懒加载");
//                    return null;
//                } else {
//                    Object property = lazyPropertyHolder.getProperty();
//                    property.toString(); // 需要显式的调用结果对象的引用
//                    Field cglib$LAZY_loader_0 = property.getClass().getDeclaredField("CGLIB$LAZY_LOADER_0");
//                    cglib$LAZY_loader_0.setAccessible(true);
//                    return cglib$LAZY_loader_0.get(property);
//                }
//            }
//        }
        System.out.println("无需拦截" + methodName);
        return methodProxy.invokeSuper(o, objects);
    }
}