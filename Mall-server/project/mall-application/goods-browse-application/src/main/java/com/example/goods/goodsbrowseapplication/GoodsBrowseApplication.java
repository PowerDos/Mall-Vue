package com.example.goods.goodsbrowseapplication;

import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.example.goods.goodsbrowseapplication.base.repository")
public class GoodsBrowseApplication {

    public static void main(String[] args) {
        SpringApplication.run(GoodsBrowseApplication.class, args);
    }

}
