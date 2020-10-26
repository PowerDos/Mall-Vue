package com.example.seckill.config;

import org.springframework.amqp.core.Queue;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @description: rabbitmq 配置信息
 * @author: WuHao
 * @time: 2020/6/19 14:13
 */

@Configuration
public class RabbitMQConfig {

    public static final String seckillQueue = "seckill_queue";


    @Bean
    public Queue seckillQueue() {
        return new Queue(seckillQueue);
    }


}
