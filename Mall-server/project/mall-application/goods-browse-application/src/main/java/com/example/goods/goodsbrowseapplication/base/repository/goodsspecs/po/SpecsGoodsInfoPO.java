package com.example.goods.goodsbrowseapplication.base.repository.goodsspecs.po;

import lombok.Data;

/**
 * 规格中的商品信息
 *
 * <p>规格中的商品信息</p>
 *
 * @author WuHao
 * @since 2021/4/1 15:57
 */
@Data
public class SpecsGoodsInfoPO {
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
