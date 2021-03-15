package com.example.mallcommon.lazyload.listener;

import com.example.mallcommon.lazyload.LazyProperty;
import org.springframework.cglib.proxy.MethodInterceptor;

import java.util.Map;


public interface InvokeListener extends MethodInterceptor {

    void addInterceptor(Map<String,LazyProperty> propertyMap, Class<?> exceptCls);

}
