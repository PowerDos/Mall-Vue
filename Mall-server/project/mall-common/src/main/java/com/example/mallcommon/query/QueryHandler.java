package com.example.mallcommon.query;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 * 拦截query注解并实现对其增强的类
 *
 * <p>拦截query注解并实现对其增强的类</p>
 *
 * @author WuHao
 * @since 2021/3/10 9:34
 */
@Aspect
public class QueryHandler {

    private List<Field> necessaryField = new ArrayList<>();

    @Pointcut("@annotation(Query)")
    public void query() {
    }

    @Around("query()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        Query declaredAnnotation = method.getDeclaredAnnotation(Query.class);
        Class<?> DO = declaredAnnotation.DOCls();
        Class<?> DTO = declaredAnnotation.DTOCls();
        Class<?> PO = declaredAnnotation.POCls();
        getNecessaryFields(DTO);

        System.out.println("1");
        Object result = joinPoint.proceed();
        System.out.println("2");
        return result;
    }

    public void getNecessaryFields(Class<?> DTO) {
        Method[] declaredMethods = DTO.getDeclaredMethods();
        for (Method method : declaredMethods) {
            if (method.getName().startsWith("set")) {
                String fieldName = method.getName().substring(3, 4).toLowerCase() + method.getName().substring(4);
                Field field = null;
                try {
                    field = DTO.getDeclaredField(fieldName);
                    necessaryField.add(field);
                } catch (NoSuchFieldException e) {
                    // 这个方法长得像setter，但并不是
                    e.printStackTrace();
                }
            }
        }
    }


}
