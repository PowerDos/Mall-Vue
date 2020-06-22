package com.example.entitity.DTO;

import com.example.entitity.DO.BaseDo;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value = "商品类型实体类")
public class CategoryDTOOutput extends BaseDo {

    /**
     * 父类型id 0为根类型
     */
    @ApiModelProperty(value = "父类型id")
    private Long parentId;
    /**
     * 类型吗
     */
    @ApiModelProperty(value = "类型名")
    private String name;
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
