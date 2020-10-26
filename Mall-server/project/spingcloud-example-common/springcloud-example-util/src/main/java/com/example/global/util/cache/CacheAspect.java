package com.example.global.util.cache;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;

@Aspect
@Component
public class CacheAspect {

    @Autowired
    private SecondCache cache;

    @Around(value = "@annotation(com.example.global.util.cache.EnableCache)")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        String key = generateKey(joinPoint);
        String value = cache.loadCache(key);
        Object result;
        if (value == null) {
            result = joinPoint.proceed();
            cache.saveCache(key, JSON.toJSONString(result));
        } else {
            Method method = ((MethodSignature) joinPoint.getSignature()).getMethod();
            Class<?> returnType = method.getReturnType();
            if (returnType.equals(List.class)) {
                Field signature = Method.class.getDeclaredField("signature");
                signature.setAccessible(true);
                String signatureStr = signature.get(method).toString();
                signatureStr = signatureStr.substring(signatureStr.indexOf("<") + 2, signatureStr.indexOf(">") - 1);
                String doPackage = signatureStr.replaceAll("/", ".");
                Class<?> doClass = Class.forName(doPackage);
                List<Object> resultList = new ArrayList<>();
                result = JSON.parseObject(value, returnType);
                for (Object jsonObject : (List<JSONObject>) result) {
                    jsonObject = ((JSONObject) jsonObject).toJavaObject(doClass);
                    resultList.add(jsonObject);
                }
                result = resultList;
            } else if (returnType.equals(Map.class)) {
                // map
                // TODO
                result = new HashMap<>();
            } else {
                // 普通do
                result = JSON.parseObject(value, returnType);
            }

        }
        return result;
    }

    private String generateKey(ProceedingJoinPoint joinPoint) {
        String key = "";
        Signature signature = joinPoint.getSignature();
        Object[] args = joinPoint.getArgs();
        String argsStr;
        if (args.length == 0) {
            argsStr = "";
        } else {
            argsStr = ":" + StringUtils.join(joinPoint.getArgs(), "-");
        }
        if (signature instanceof MethodSignature) {
            MethodSignature methodSignature = (MethodSignature) signature;
            Method tempMethod = methodSignature.getMethod();
            String methodName = tempMethod.getName();
            String className = tempMethod.getDeclaringClass().getSimpleName();
            key = className + ":" + methodName + argsStr;
        }
        return key;
    }


}
