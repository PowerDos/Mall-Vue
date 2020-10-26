package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class AttributeKeyDO extends BaseDo {
    /**
     * 商品属性id
     */
    @ApiModelProperty(value = "商品属性id")
    private Long categoryId;

    /**
     * 商品属性分类
     */
    @ApiModelProperty(value = "商品属性分类")
    private String attributeName;

    /**
     * 名称排序
     */
    @ApiModelProperty(value = "名称排序")
    private String nameSort;

    /**
     * 乐观锁
     */
    @ApiModelProperty(value = "乐观锁")
    private Long revision;

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
