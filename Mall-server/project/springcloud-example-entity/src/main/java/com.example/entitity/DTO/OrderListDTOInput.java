package com.example.entitity.DTO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class OrderListDTOInput {

    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户id")
    private Long userId;

    /**
     * 订单商品id集合
     */
    @ApiModelProperty(value = "订单商品id集合")
    private Long orderDetailIdList;

    /**
     * 订单总价（分）
     */
    @ApiModelProperty(value = "订单总价（分）")
    private Long totalPrice;

}
