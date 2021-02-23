package com.example.order.ordercancelapplication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class OrderCancelApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrderCancelApplication.class, args);
    }

}
