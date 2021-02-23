package com.example.goods.goodsbrowse;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class GoodsBrowseApplication {

    public static void main(String[] args) {
        SpringApplication.run(GoodsBrowseApplication.class, args);
    }

}
