package com.example.mallcommon.lazyload.container;

import com.example.mallcommon.lazyload.LazyProperty;
import com.example.mallcommon.lazyload.listener.MethodInvokeListener;
import org.springframework.cglib.proxy.Enhancer;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 用于存放方法增强器 {@code MethodInvokeListener} 与属性持有者 {@code LazyPropertyHolder} 的抽象类
 *
 * <p>存放了{@code expectCls与proxySource} </p>
 * <p>存放了{@code methodInvokeListener} 方法增强器 </p>
 * <p>存放了{@code lazyProperties} 属性持有者集合 </p>
 *
 * @param <T> 期望的目标代理对象类型
 * @author WuHao
 * @see MethodInvokeListener 方法增强器
 * @see LazyProperty 懒加载属性
 * @since 2021/3/12 11:51
 */
public abstract class AbstractTargetEnhancer<T> implements TargetEnhancer<T> {

    /**
     * 期望获得的目标对象的类型
     */
    protected Class<?> expectCls;

    /**
     * 属性来源的源对象
     */
    protected Object proxySource;

    /**
     * 用于对代理对象进行拦截器的对象
     */
    private MethodInvokeListener methodInvokeListener;

    /**
     * 用于存放源对象中的已有属性
     * <p>
     * {@code sourceFieldName,LazyProperty{lazyLoader} }
     *
     * @see LazyProperty
     */
    protected Map<String, LazyProperty> lazyProperties = new LinkedHashMap<>();


    /**
     * 在初始化阶段，获得必要的参数，并且不允许子类重写
     *
     * @param source    需要进行转换增强的原始对象
     * @param expectCls 期望的目标对象类型
     */
    @Override
    public final void initialize(Object source, Class<?> expectCls) {
        this.expectCls = expectCls;
        this.proxySource = source;
        lazyProperties = getAllRequireLazyLoadProperties();
        methodInvokeListener = configInterceptor();
    }

    /**
     * 计算所有需要懒加载的属性，并使用对应的属性持有者填充
     *
     * @return 需要懒加载的属性集合
     */
    protected abstract Map<String, LazyProperty> getAllRequireLazyLoadProperties();

    protected abstract MethodInvokeListener configInterceptor();

    public final T getTarget() {
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(expectCls);
        enhancer.setCallback(methodInvokeListener);
        return (T) enhancer.create();
    }


}
