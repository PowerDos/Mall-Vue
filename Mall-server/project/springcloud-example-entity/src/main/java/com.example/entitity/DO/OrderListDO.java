package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class OrderListDO {
    /**
     * 订单id
     */
    @ApiModelProperty(value = "订单id")
    private Long orderId;

    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户id")
    private Long userId;

    /**
     * 订单商品id集合
     */
    @ApiModelProperty(value = "订单商品id集合")
    private Long orderDetailIdList;

    /**
     * 订单总价（分）
     */
    @ApiModelProperty(value = "订单总价（分）")
    private Long totalPrice;

    /**
     * 乐观锁
     */
    @ApiModelProperty(value = "乐观锁")
    private Long version;

    /**
     * 创建人
     */
    @ApiModelProperty(value = "创建人")
    private String createdBy;

    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间")
    private Date createdTime;

    /**
     * 创建人
     */
    @ApiModelProperty(value = "创建人")
    private String updatedBy;

    /**
     * 修改时间
     *
     */
    @ApiModelProperty(value = "修改时间")
    private Date updatedTime;

}
