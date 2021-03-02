package com.example.goods.goodsbrowseapplication.domain.goodscolumn;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.entity.Column;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsColumnHeat;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsInfoInGoodsColumn;
import lombok.Data;
import lombok.ToString;

/**
 * @author WuHao
 * @Description: 商城首页中的一个商品栏目
 * @since 2021/2/21 17:37
 */
@Data
@ToString
public class GoodsColumn {

    /**
     * 栏目
     */
    private Column column;

    /**
     * 栏目中包含的商品信息
     */
    private GoodsInfoInGoodsColumn goodsInfo;

    /**
     * 栏目热度
     */
    private GoodsColumnHeat heat;

    /**
     * 浏览商品栏目，获取栏目信息
     */
    public void browseColumn() {
        goodsInfo.browseGoodsInfo();
    }
}
