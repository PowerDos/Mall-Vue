package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class GoodDiscountDO {
    /**
     * 优惠活动id
     */
    @ApiModelProperty(value = "优惠活动id")
    private Long discountId;

    /**
     * 优惠内容
     */
    @ApiModelProperty(value = "优惠内容")
    private String content;
}
