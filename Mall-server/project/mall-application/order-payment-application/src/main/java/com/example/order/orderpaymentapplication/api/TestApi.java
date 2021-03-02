package com.example.order.orderpaymentapplication.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author  WuHao
 * @Description: Test Api
 * @since  2021/2/25 13:25
 */
@RestController
public class TestApi {

    @GetMapping("/test")
    public String test() {
        return "success";
    }
}
