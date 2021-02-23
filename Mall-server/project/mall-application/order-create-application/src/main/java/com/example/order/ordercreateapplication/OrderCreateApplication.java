package com.example.order.ordercreateapplication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class OrderCreateApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrderCreateApplication.class, args);
    }

}
