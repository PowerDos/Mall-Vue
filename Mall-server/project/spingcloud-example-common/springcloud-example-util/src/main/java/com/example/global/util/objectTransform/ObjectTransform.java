package com.example.global.util.objectTransform;/**
 * @title: ObjectTransform
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/3/411:54
 */

import org.springframework.beans.BeanUtils;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/03/04
 */
public class ObjectTransform {
    public static <T> T transform(Object raw, Class<T> targetCls) {
        if (raw == null || targetCls == null) {
            return null;
        }
        try {
            T newInstance = targetCls.newInstance();
            BeanUtils.copyProperties(raw, newInstance);
            return newInstance;
        } catch (Exception e) {
            return null;
        }
    }
}

