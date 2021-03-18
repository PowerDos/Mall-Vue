package com.example.goods.goodsbrowseapplication.base.repository.goodscolumn.po;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.entity.Column;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsColumnHeat;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsInfoInGoodsColumn;
import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * @author WuHao
 * @Description: 商城首页中的一个商品栏目
 * @since 2021/2/21 17:37
 */
@Data
public class GoodsColumnPO {

    /**
     * 栏目
     */
    private ColumnPO column;

    /**
     * 栏目中包含的商品信息
     */
    private GoodsInfoInColumnPO goodsInfo;

    /**
     * 栏目热度
     */
    private GoodsColumnHeatPO heat;

}
