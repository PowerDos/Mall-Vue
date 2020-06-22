package com.example.entitity.DO;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

@Data
public class SeckillDO {

    /**
     * 秒杀id
     */
    @ApiModelProperty(value = "秒杀id")
    private Long seckillId;


    /**
     * 秒杀商品id
     */
    @ApiModelProperty(value = "秒杀商品id")
    private Long seckillGoodId;

    /**
     * 库存量
     */
    @ApiModelProperty(value = "秒杀id")
    private Integer stock;

    /**
     * 秒杀开始时间
     */
    @ApiModelProperty(value = "秒杀开始时间")
    private Date startTime;

    /**
     * 秒杀结束时间
     */
    @ApiModelProperty(value = "秒杀结束时间")
    private Date endTime;

    /**
     * 乐观锁
     */
    @ApiModelProperty(value = "乐观锁")
    private Integer vision;

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
}
