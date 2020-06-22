package com.example.seckill;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableEurekaClient
@MapperScan("com.example.seckill.mapper")
@EnableSwagger2
@EnableApolloConfig
@EnableFeignClients
@ComponentScan(basePackages = {"com.example.seckill", "com.example.global"})
public class SecKillApplication8002 {
    public static void main(String[] args) {
        SpringApplication.run(SecKillApplication8002.class, args);
    }
}
