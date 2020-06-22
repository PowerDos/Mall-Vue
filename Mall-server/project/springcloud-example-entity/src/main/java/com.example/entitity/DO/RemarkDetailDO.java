package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class RemarkDetailDO {

    /**
     * 商品评论信息id
     */
    @ApiModelProperty(value = "商品评论信息id")
    private Long remarkDetailId;

    /**
     * 评论用户
     */
    @ApiModelProperty(value = "评论用户")
    private String username;

    /**
     * 商品评论人id
     */
    @ApiModelProperty(value = "商品评论人id")
    private Long userId;

    /**
     * 商品评分（5分制）
     */
    @ApiModelProperty(value = "商品评分（5分制）")
    private Integer values;

    /**
     * 商品评论内容
     */
    @ApiModelProperty(value = "商品评论内容")
    private String content;

    /**
     * 购买商品规格信息
     */
    @ApiModelProperty(value = "购买商品规格信息")
    private String goods;

    /**
     * 购买商品id
     */
    @ApiModelProperty(value = "购买商品id")
    private Long goodsProductId;

    /**
     * 购买商品id
     */
    @ApiModelProperty(value = "购买商品id")
    private Long goodsSpecsId;

    /**
     * 评论时间
     */
    @ApiModelProperty(value = "评论时间")
    private Date createAt;
}
