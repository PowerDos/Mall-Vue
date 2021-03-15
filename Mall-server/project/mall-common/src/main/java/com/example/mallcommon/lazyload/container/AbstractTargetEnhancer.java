package com.example.mallcommon.lazyload.container;

import com.example.mallcommon.lazyload.LazyProperty;
import com.example.mallcommon.lazyload.listener.InvokeListener;
import org.springframework.cglib.proxy.Enhancer;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 用于存放转换后生成的目标代理对象以及各种listener的抽象类
 *
 * <p> </p>
 *
 * @param <T> 期望的目标代理对象类型
 * @author WuHao
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
    private InvokeListener invokeListener;

    /**
     * 用于存放源对象中的已有属性
     * <p>
     * {@code sourceFieldName,LazyProperty{lazyLoader} }
     *
     * @see LazyProperty
     */
    protected Map<String, LazyProperty> lazyProperties = new LinkedHashMap<>();


    @Override
    public final void initialize(Object source, Class<?> expectCls) {
        this.expectCls = expectCls;
        this.proxySource = source;
        lazyProperties = configProperties();
        invokeListener = configInterceptor();
    }

    protected abstract Map<String, LazyProperty> configProperties();

    protected abstract InvokeListener configInterceptor();


    public abstract void addIgnoreLazyProperty() throws Exception;

    public final T getTarget() {
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(expectCls);
        enhancer.setCallback(invokeListener);
        return (T) enhancer.create();
    }


}
