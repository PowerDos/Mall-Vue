package com.example.goods.goodsbrowseapplication.base.repository.goodscolumn.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 商品信息
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class GoodsInfoPO {
    /**
     * 商品Id
     */
    private String goodsId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品图片
     */
    private String img;

    /**
     * 商品描述
     */
    private String describe;

    /**
     * 在栏目中展示该商品的时间
     */
    private Date showTime;

    /**
     * 在栏目中停止展示该商品的时间
     */
    private Date offTime;
}