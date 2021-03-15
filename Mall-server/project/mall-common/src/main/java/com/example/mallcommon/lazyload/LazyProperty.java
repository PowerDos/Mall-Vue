package com.example.mallcommon.lazyload;

import com.example.mallcommon.lazyload.property.LazyPropertyHolder;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class LazyProperty {
    public Class<?> listType;

    public LazyPropertyHolder<?> lazyPropertyHolder;
}