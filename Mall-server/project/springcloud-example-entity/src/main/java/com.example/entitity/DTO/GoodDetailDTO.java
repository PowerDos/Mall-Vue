package com.example.entitity.DTO;

import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class GoodDetailDTO {
    /**
     * 商品id
     *
     */
    @ApiModelProperty(value = "商品id")
    private Long productId;

    /**
     * 商品图标url
     */
    @ApiModelProperty(value = "商品图标url")
    private List<String> goodsImg;


    /**
     * 商品名
     */
    @ApiModelProperty(value = "商品名")
    private String title;

    /**
     * 商品名下红色标签
     */
    @ApiModelProperty(value = "商品标签")
    private List<String> tags;

    /**
     * 优惠政策
     */
    @ApiModelProperty(value = "优惠政策")
    private List<String> discount;

    /**
     * 促销活动
     */
    @ApiModelProperty(value = "促销活动")
    private List<String> promotion;

    /**
     * 累计评价数
     */
    @ApiModelProperty(value = "累计评价数")
    private Long remarksNum;

    /**
     * 尺寸规格信息
     */
    @ApiModelProperty(value = "尺寸规格信息")
    private List<List<JSONObject>> setMeal;

    /**
     * 店铺热销
     */
    @ApiModelProperty(value = "店铺热销")
    private List<JSONObject> hot;

    /**
     * 商品详细图片url
     */
    @ApiModelProperty(value = "商品详细图片url")
    private List<String> goodsDetail;

    /**
     * 商品规格参数
     */
    @ApiModelProperty(value = "商品规格参数")
    private List<JSONObject> param;

    /**
     * 商品评价信息
     */
    @ApiModelProperty(value = "商品评价信息")
    private JSONObject remarks;

}
