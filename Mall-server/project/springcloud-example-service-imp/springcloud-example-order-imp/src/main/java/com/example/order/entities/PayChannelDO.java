package com.example.order.entities;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class PayChannelDO {

    /**
     * 支付渠道id
     */
    @ApiModelProperty(value = "支付渠道id")
    private Long channelId;

    /**
     * 支付渠道名
     */
    @ApiModelProperty(value = "支付渠道名")
    private String channelName;

    /**
     * 支付渠道实现bean Name
     */
    @ApiModelProperty(value = "支付渠道实现bean Name")
    private String channelBean;


    /**
     * appId
     */
    @ApiModelProperty(value = "appId")
    private Long appId;

    /**
     * 应用公钥
     */
    @ApiModelProperty(value = "应用公钥")
    private String publicKey;

    /**
     * 渠道公钥
     */
    @ApiModelProperty(value = "渠道公钥")
    private String platformPublicKey;

    /**
     * 应用私钥
     */
    @ApiModelProperty(value = "应用私钥")
    private String privateKey;

    /**
     * 渠道启用状态
     */
    @ApiModelProperty(value = "渠道启用状态")
    private Integer statue;

    /**
     * 乐观锁
     */
    @ApiModelProperty(value = "乐观锁")
    private String vision;

    /**
     * createdBy
     */
    @ApiModelProperty(value = "创建人")
    private String createdBy;

    /**
     * 创建时间
     */
    @ApiModelProperty(value = "创建时间")
    private Date createdTime;

    /**
     * updatedBy
     */
    @ApiModelProperty(value = "更新人")
    private String updatedBy;

    /**
     * 更新时间
     */
    @ApiModelProperty(value = "更新时间")
    private Date updatedTime;

}
