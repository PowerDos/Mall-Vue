package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class GoodPromotionDO {
    /**
     * 促销政策id
     */
    @ApiModelProperty(value = "促销政策id")
    private Long promotionId;

    /**
     * 促销内容
     */
    @ApiModelProperty(value = "促销内容")
    private String content;
}
