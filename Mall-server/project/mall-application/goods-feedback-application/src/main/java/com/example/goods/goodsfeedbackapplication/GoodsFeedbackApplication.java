package com.example.goods.goodsfeedbackapplication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class GoodsFeedbackApplication {

    public static void main(String[] args) {
        SpringApplication.run(GoodsFeedbackApplication.class, args);
    }

}
