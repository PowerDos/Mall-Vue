package com.example.filter.util;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

/**
 * 当数据
 * Create by liping on 2018/9/14
 */
public class MultiPartFormDateToJson {

    public static Map<String, String> toMap(String params) {
        Map<String, String> map = new HashMap<>();
        //获得分隔符
        String boundary = params.split("\r\n")[0];
        //获得分割后的参数
        String[] ps = Optional.ofNullable(params).orElse("").split(boundary);
        for (String p : ps) {
            if (p.equals(""))
                continue;
            if (p.equals("--\r\n"))
                continue;
            p = p.trim().replaceAll("\r\n", "&&");
            String[] ds = p.split(";");
            //获得参数名
            String nameMeta = Arrays.asList(ds).stream()
                    .filter(d -> d.trim().startsWith("name="))
                    .findAny()
                    .orElse("");
            String name = Optional.ofNullable(nameMeta.split("\"")[1]).orElse("");
            //获得参数值
            String value = Optional.ofNullable(StringUtils.substringAfter(p, "&&&&")).orElse("");
            map.put(name, value);
        }
        return map;
    }


    public static String formDateToJson(String param) {
        return JSON.toJSONString(toMap(param));
    }

}