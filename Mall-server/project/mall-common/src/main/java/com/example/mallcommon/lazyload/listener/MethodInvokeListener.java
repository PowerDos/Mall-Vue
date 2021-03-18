package com.example.mallcommon.lazyload.listener;

import com.example.mallcommon.lazyload.LazyProperty;
import org.springframework.cglib.proxy.MethodInterceptor;

import java.util.Map;

/**
 * 方法增强器
 *
 * <P>对目标对象进行拦截</P>
 */
public interface MethodInvokeListener extends MethodInterceptor {

    /**
     * 配置所有需要拦截的列表和填充属性
     *
     * @param propertyMap 需要被拦截的属性表({@code Map<fieldName,lazyProperty> })
     */
    void addInterceptor(Map<String, LazyProperty> propertyMap);

}
