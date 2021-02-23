package com.example.goods.goodsstatisticsapplication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class GoodsStatisticsApplication {

    public static void main(String[] args) {
        SpringApplication.run(GoodsStatisticsApplication.class, args);
    }

}
