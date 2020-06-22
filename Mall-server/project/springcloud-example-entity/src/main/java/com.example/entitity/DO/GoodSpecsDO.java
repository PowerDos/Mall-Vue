package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class GoodSpecsDO {

    /**
     * 商品规格id
     */
    @ApiModelProperty(value = "商品规格id")
    private Long specs_id;

    /**
     * 商品规格排序
     */
    @ApiModelProperty(value = "商品规格排序")
    private Long specSeq;

    /**
     * 商品规格大图
     */
    @ApiModelProperty(value = "商品规格大图")
    private String bigImg;

    /**
     * 商品规格小图
     */
    @ApiModelProperty(value = "商品规格小图")
    private String smallImg;

    /**
     * 商品规格介绍
     */
    @ApiModelProperty(value = "商品规格介绍")
    private String intro;

    /**
     * 商品对应规格的库存
     */
    @ApiModelProperty(value = "商品对应规格的库存")
    private Long stock;

    /**
     * 商品对应规格的价格
     */
    @ApiModelProperty(value = "商品对应规格的价格")
    private Float price;

    /**
     * 乐观锁版本
     */
    @ApiModelProperty(value = "乐观锁")
    private Long revision;

    /**
     * createdBy
     */
    @ApiModelProperty(value = "创建人")
    private String createdBy;

    /**
     * createdTime
     */
    @ApiModelProperty(value = "创建时间")
    private String createdTime;

    /**
     * updatedBy
     */
    @ApiModelProperty(value = "更新人")
    private String updatedBy;

    /**
     * updatedTime
     */
    @ApiModelProperty(value = "更新时间")
    private String updatedTime;
}
