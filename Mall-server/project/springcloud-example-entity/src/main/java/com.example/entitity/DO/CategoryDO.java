package com.example.entitity.DO;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.util.Date;

@Data
@ApiModel(value = "商品类型实体类")
public class CategoryDO extends BaseDo {

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
     * 类别状态
     */
    @ApiModelProperty(value = "状态")
    private Long status;
    /**
     * es分类的顺序
     */
    @ApiModelProperty(value = "分类顺序")
    private Long sortOrder;
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
     * updatedBy
     */
    @ApiModelProperty(value = "更新人")
    private String updatedBy;

}
