package com.example.goods.goodsbrowseapplication;

import com.example.mallcommon.query.QueryHandler;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;

@SpringBootApplication
@EnableDiscoveryClient
@MapperScan("com.example.goods.goodsbrowseapplication.base.repository")
@EnableAspectJAutoProxy
@Import(QueryHandler.class)
public class GoodsBrowseApplication {

    public static void main(String[] args) {
        SpringApplication.run(GoodsBrowseApplication.class, args);
    }

}
