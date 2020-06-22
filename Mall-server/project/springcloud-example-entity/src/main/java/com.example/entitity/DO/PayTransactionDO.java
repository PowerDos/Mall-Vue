package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class PayTransactionDO{
    /**
     * 主键id
     */
    @ApiModelProperty(value = "主键id")
    private Long id;

    /**
     * 支付交易id
     */
    @ApiModelProperty(value = "支付交易id")
    private Long transactionId;

    /**
     * 实付金额（分）
     */
    @ApiModelProperty(value = "实付金额（分）")
    private Long payAmount;

    /**
     * 交易状态 0：交易成功 1：待付款  2：取消支付 3：交易失败
     */
    @ApiModelProperty(value = "交易状态 0：交易成功 1：待付款  2：取消支付 3：交易失败")
    private Integer payStatue;

    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户id")
    private Long userId;

    /**
     * 订单id
     */
    @ApiModelProperty(value = "订单id")
    private Long orderId;

    /**
     * 第三方支付方式渠道id
     */
    @ApiModelProperty(value = "第三方支付方式渠道id")
    private Long channelId;

    /**
     * 第三方支付流水号
     */
    @ApiModelProperty(value = "第三方支付流水号")
    private String thirdPartTransactionId;

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
