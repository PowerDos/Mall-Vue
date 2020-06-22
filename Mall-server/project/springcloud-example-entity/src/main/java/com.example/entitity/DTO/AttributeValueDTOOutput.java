package com.example.entitity.DTO;

import com.example.entitity.DO.BaseDo;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class AttributeValueDTOOutput extends BaseDo {
    /**
     * 商品属性id
     */
    @ApiModelProperty(value = "商品属性id")
    private Long attributeId;

    /**
     * 商品属性名
     */
    @ApiModelProperty(value = "商品属性名")
    private String attributeValue;

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
