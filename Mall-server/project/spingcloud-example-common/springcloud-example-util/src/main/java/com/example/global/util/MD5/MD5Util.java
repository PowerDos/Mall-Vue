package com.example.global.util.MD5;/**
 * @title: MD5Util
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2521:25
 */

import java.security.MessageDigest;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/25
 */
public class MD5Util {
    private static final String salt = "EXAMPLE_MEMBER";

    public static String MD5(String s) {
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        try {
            byte[] btInput = (s + salt).getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char[] str = new char[j * 2];
            int k = 0;
            for (byte byte0 : md) {
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
