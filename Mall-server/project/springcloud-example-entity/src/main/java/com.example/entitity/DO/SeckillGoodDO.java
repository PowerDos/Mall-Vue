package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class SeckillGoodDO {
    /**
     * 秒杀商品id
     */
    @ApiModelProperty(value = "秒杀商品id")
    private Long seckillGoodId;

    /**
     * 商品id
     */
    @ApiModelProperty(value = "商品id")
    private Long productId;

    /**
     * 商品规格id
     */
    @ApiModelProperty(value = "商品规格id")
    private Long specsId;

    /**
     * 秒杀商品名称
     */
    @ApiModelProperty(value = "秒杀商品名称")
    private String intro;

    /**
     * 秒杀商品图片
     */
    @ApiModelProperty(value = "秒杀商品图片")
    private String img;

    /**
     * 秒杀价
     */
    @ApiModelProperty(value = "秒杀价")
    private Float price;

    /**
     * 商品原价
     */
    @ApiModelProperty(value = "商品原价")
    private Float realPrice;

}
