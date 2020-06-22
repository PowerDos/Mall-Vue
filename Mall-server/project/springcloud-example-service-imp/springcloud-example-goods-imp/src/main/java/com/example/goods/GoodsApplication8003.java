package com.example.goods;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
//@EnableHystrix
@MapperScan("com.example.goods.mapper")
@EnableSwagger2
@EnableApolloConfig
@ComponentScan(basePackages = {"com.example.goods","com.example.global"})
public class GoodsApplication8003 {
    public static void main(String[] args) {
        SpringApplication.run(GoodsApplication8003.class,args);
    }
}
