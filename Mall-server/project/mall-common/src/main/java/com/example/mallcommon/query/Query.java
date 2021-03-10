package com.example.mallcommon.query;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Query {

    Class<?> DTOCls() default Object.class;

    Class<?> DOCls() default Object.class;

    Class<?> POCls() default Object.class;


}
