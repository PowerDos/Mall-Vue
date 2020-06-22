package com.example.member;/**
 * @title: MemberApplication
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/1/3113:48
 */


import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/01/31
 */
@SpringBootApplication
@MapperScan("com.example.member.mapper")
@EnableEurekaClient
@EnableFeignClients
//@EnableHystrix
@EnableSwagger2
@EnableApolloConfig
@ComponentScan(basePackages = {"com.example.member","com.example.global"})
public class MemberApplication8001 {
    public static void main(String[] args) {
        SpringApplication.run(MemberApplication8001.class, args);
    }
}
