package com.example.remarks;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.ComponentScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableEurekaClient
@MapperScan("com.example.remarks.mapper")
@EnableSwagger2
@EnableApolloConfig
@ComponentScan(basePackages = {"com.example.remarks","com.example.global"})
public class RemarksApplication8004 {
    public static void main(String[] args) {
        SpringApplication.run(RemarksApplication8004.class,args);
    }
}
