package com.example.goods.goodsbrowseapplication.domain.goodsspecs.valueobject;


import lombok.Data;

/**
 * 规格商品信息
 *
 * <p>规格商品信息</p>
 *
 * @author WuHao
 * @since 2021/4/1 16:01
 */
@Data
public class SpecsGoodsInfo {
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
    private String goodsImg;

    /**
     * 商品描述
     */
    private String goodsDescribe;
}
