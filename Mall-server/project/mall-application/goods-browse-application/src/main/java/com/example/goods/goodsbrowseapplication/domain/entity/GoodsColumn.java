package com.example.goods.goodsbrowseapplication.domain.entity;

import com.example.goods.goodsbrowseapplication.domain.valueobject.GoodsColumnHeat;
import com.example.goods.goodsbrowseapplication.domain.valueobject.GoodsInfoInGoodsColumn;

/**
 * @Author: WuHao
 * @Description: 商城首页中的商品栏目
 * @Date: 2021/2/21 17:37
 */
public class GoodsColumn {
    /**
     * 栏目ID
     */
    private String columnId;

    /**
     * 栏目名
     */
    private String columnName;

    /**
     * 栏目中包含的商品信息
     */
    private GoodsInfoInGoodsColumn goodsInfo;

    /**
     * 栏目热度
     */
    private GoodsColumnHeat heat;
}
