package com.example.order.orderpaymentapplication.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: WuHao
 * @Description: Test Api
 * @Date: 2021/2/25 13:25
 */
@RestController
public class TestApi {

    @GetMapping("/test")
    public String test() {
        return "success";
    }
}
