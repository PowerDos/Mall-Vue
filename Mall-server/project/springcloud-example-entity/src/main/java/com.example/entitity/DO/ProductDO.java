package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
public class ProductDO extends BaseDo {

    /**
     * 产品id
     */
    @ApiModelProperty(value = "产品id")
    private Long id;

    /**
     * 产品的类型id
     */
    @ApiModelProperty(value = "产品的类型id")
    private String categoryId;

    /**
     * 产品名
     */
    @ApiModelProperty(value = "产品名")
    private String name;

    /**
     * 产品简介
     */
    @ApiModelProperty(value = "产品简介")
    private String intro;

    /**
     * 图像地址
     */
    @ApiModelProperty(value = "图像地址")
    private String img;

    /**
     * 产品的所有规格型号id
     */
    @ApiModelProperty(value = "产品的所有规格型号id")
    private String attributeIdList;

    /**
     * 产品最低价
     */
    @ApiModelProperty(value = "产品最低价(这将展示在产品分类页面中)")
    private String lowestPrice;

    /**
     * 店家名
     */
    @ApiModelProperty(value = "店家名")
    private String shopName;

    /**
     * 商品所有评论id
     */
    @ApiModelProperty(value = "商品所有评论id")
    private Long remarksId;

    /**
     * 历史销量
     */
    @ApiModelProperty(value = "历史销量")
    private Long sale;

    /**
     * 评价数
     */
    @ApiModelProperty(value = "评价数")
    private Long comment;

    /**
     * 状态
     */
    @ApiModelProperty(value = "状态")
    private String status;

    /**
     * 乐观锁
     */
    @ApiModelProperty(value = "乐观锁")
    private String revision;

    /**
     * createdBy
     */
    @ApiModelProperty(value = "创建人")
    private String createdBy;

    /**
     * updatedBy
     */
    @ApiModelProperty(value = "更新人")
    private String updatedBy;
}
