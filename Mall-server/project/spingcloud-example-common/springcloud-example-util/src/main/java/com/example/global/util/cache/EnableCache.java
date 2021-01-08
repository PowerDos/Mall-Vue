package com.example.global.util.cache;


import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

@Target({ElementType.TYPE,ElementType.METHOD})
public @interface EnableCache {
    String name() default "ehcache+redis";
}
