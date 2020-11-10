package com.example.domin.DTO;

import com.example.domin.DO.OrderDetailDO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
public class PayInfoDTOInput {
    /**
     * 商品列表
     *
     * JSONObject example
     * {
     *     productId,
     *     specsId,
     *     count,
     *     price
     * }
     */
    @ApiModelProperty(value = "商品列表")
    private List<OrderDetailDO> payList;

    /**
     * 优惠券id集合
     */
    @ApiModelProperty(value = "优惠券id集合")
    private List<Integer> couponIdList;

    /**
     * 支付渠道选择
     */
    @ApiModelProperty(value = "支付渠道选择")
    private String payChannelBean;
}
