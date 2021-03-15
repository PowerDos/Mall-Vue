package com.example.mallcommon.lazyload.container;

public interface TargetEnhancer<T> {
    void initialize(Object source, Class<?> expectCls);

    T getTarget();
}
