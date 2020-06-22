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
public class ObjectTransform<Dto, Do> {

    /**
     * dot 转换为Do 工具类
     *
     * @param dtoEntity 要转换的dto实例
     * @param doClass   转换的目标类
     * @return Do
     */
    public static <Do> Do dtoToDo(Object dtoEntity, Class<Do> doClass) {
        // 判断dto是否为空!
        if (dtoEntity == null) {
            return null;
        }
        // 判断DoClass 是否为空
        if (doClass == null) {
            return null;
        }
        try {
            Do newInstance = doClass.newInstance();
            BeanUtils.copyProperties(dtoEntity, newInstance);
            // Dto转换Do
            return newInstance;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * do 转换为Dto 工具类
     *
     * @param doEntity 要转换的dto实例
     * @param dtoClass 要转换的目标类
     * @return Dto
     */
    public static <Dto> Dto doToDto(Object doEntity, Class<Dto> dtoClass) {
        // 判断dto是否为空!
        if (doEntity == null) {
            return null;
        }
        // 判断DoClass 是否为空
        if (dtoClass == null) {
            return null;
        }
        try {
            Dto newInstance = dtoClass.newInstance();
            BeanUtils.copyProperties(doEntity, newInstance);
            // Dto转换Do
            return newInstance;
        } catch (Exception e) {
            return null;
        }
    }
}

