package com.example.mallcommon.lazyload.listener;

import com.example.mallcommon.lazyload.LazyProperty;
import org.springframework.cglib.proxy.MethodInterceptor;

import java.util.List;


public interface InvokeListener extends MethodInterceptor {

    void addInterceptor(List<LazyProperty> propertyMap,Class<?> exceptCls);

}
