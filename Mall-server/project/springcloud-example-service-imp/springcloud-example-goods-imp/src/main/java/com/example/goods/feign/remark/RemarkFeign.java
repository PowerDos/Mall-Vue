package com.example.goods.feign.remark;

import com.example.api.RemarksService;
import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(name = "spring-cloud-remarks")
public interface RemarkFeign extends RemarksService {

}
