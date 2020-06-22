package com.example.order.feign.goods;

import com.example.api.GoodsService;
import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(name = "spring-cloud-goods")
public interface GoodServiceFeign extends GoodsService {
}
