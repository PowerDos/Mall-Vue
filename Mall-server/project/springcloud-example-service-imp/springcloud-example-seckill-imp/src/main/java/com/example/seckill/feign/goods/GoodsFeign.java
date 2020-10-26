package com.example.seckill.feign.goods;


import com.example.api.GoodsServiceApi;
import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(name = "spring-cloud-goods")
public interface GoodsFeign extends GoodsServiceApi {
}
