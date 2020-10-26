package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class OrderDetailDO {
    /**
     * 商品详情信息id
     */
    @ApiModelProperty(value = "商品详情信息id")
    private Long orderDetailId;

    /**
     * 商品id
     */
    @ApiModelProperty(value = "商品id")
    private Long productId;

    /**
     * 规格id
     */
    @ApiModelProperty(value = "规格id")
    private Long specsId;

    /**
     * 购买数量
     */
    @ApiModelProperty(value = "购买数量")
    private Long count;

    /**
     * 商品单价
     */
    @ApiModelProperty(value = "商品单价")
    private Long price;
}
