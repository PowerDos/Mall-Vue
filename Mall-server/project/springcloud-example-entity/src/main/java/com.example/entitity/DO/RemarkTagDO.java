package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class RemarkTagDO {

    /**
     * 商品评价标签id
     */
    @ApiModelProperty(value = "商品评价标签id")
    private Long remarkTagId;

    /**
     * 商品评价标签内容
     */
    @ApiModelProperty(value = "商品评价标签内容")
    private String content;
}
