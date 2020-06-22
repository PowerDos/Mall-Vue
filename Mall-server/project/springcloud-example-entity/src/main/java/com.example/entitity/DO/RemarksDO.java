package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class RemarksDO {

    /**
     * 商品评价id
     */
    @ApiModelProperty(value = "商品评价id")
    private Long remarksId;

    /**
     * 商品好评率
     */
    @ApiModelProperty(value = "商品好评率")
    private Integer goodAnalyse;

    /**
     * 商品评价标签id集合
     */
    @ApiModelProperty(value = "商品评价标签id集合")
    private String remarksTagIdList;

    /**
     * 商品追评数量
     */
    @ApiModelProperty(value = "商品追评数量")
    private Integer addRemarksNum;

    /**
     * 商品好评数量
     */
    @ApiModelProperty(value = "商品好评数量")
    private Integer goodRemarksNum;

    /**
     * 商品中评数量
     */
    @ApiModelProperty(value = "商品中评数量")
    private Integer midRemarksNum;

    /**
     * 商品差评数量
     */
    @ApiModelProperty(value = "商品差评数量")
    private Integer badRemarksNum;

    /**
     * 商品评价信息id集合
     */
    @ApiModelProperty(value = "商品评价信息id集合")
    private String remarksDetailIdList;
}
