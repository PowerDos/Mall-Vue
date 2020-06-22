package com.example.order;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableEurekaClient
@MapperScan("com.example.order.mapper")
//@EnableHystrix
@EnableSwagger2
@EnableApolloConfig
@EnableFeignClients
@ComponentScan(basePackages = {"com.example.order","com.example.global"})
public class OrderApplication8005 {
    public static void main(String[] args) {
        SpringApplication.run(OrderApplication8005.class, args);
    }
}
