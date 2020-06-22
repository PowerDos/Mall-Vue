package com.example.global.util.snowFlake;

public class SnowFlakeIdUtil {
    private static SnowFlakeIdGenerator generator = new SnowFlakeIdGenerator(1, 1);

    /**
     * 根据雪花算法生成唯一字符串
     * @return 唯一字符串
     */
    public static String nextId() {
        return generator.nextId() + "";
    }

    public static int HashCode() {
        return generator.hashCode();
    }
}
