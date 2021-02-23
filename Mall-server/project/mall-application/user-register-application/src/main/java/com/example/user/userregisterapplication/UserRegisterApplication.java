package com.example.user.userregisterapplication;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class UserRegisterApplication {

    public static void main(String[] args) {
        SpringApplication.run(UserRegisterApplication.class, args);
    }

}
