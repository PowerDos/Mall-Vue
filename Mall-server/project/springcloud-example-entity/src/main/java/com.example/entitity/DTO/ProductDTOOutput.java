package com.example.entitity.DTO;

import com.example.entitity.DO.BaseDo;
import com.example.entitity.DO.ProductDO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ProductDTOOutput extends BaseDo {

    public ProductDTOOutput(Long id,String categoryId, String name, String intro, String img, String attributeIdList, String lowestPrice, String shopName, Long sale, Long comment) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.intro = intro;
        this.img = img;
        this.attributeIdList = attributeIdList;
        this.lowestPrice = lowestPrice;
        this.shopName = shopName;
        this.sale = sale;
        this.comment = comment;
    }
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

}
