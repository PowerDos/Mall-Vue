package com.example.goods.goodsbrowseapplication.domain.goodscolumn.factory;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.entity.Column;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.po.GoodsColumnPO;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsColumnHeat;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsInfoInGoodsColumn;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>商品栏目DO与PO对象转换工厂</p>
 *
 * @author WuHao
 * @since 2021/3/2 10:20
 */
public class GoodsColumnFactory {

    public static GoodsColumn convertGoodsColumnFromPO(GoodsColumnPO goodsColumnPO) {
        GoodsColumn goodsColumn = new GoodsColumn();
        goodsColumn.setColumn(new Column(goodsColumnPO.getColumnId(), goodsColumnPO.getColumnName(), goodsColumnPO.getEnable()));
        goodsColumn.setGoodsInfo(new GoodsInfoInGoodsColumn(goodsColumnPO.getGoodsInfoList()));
        goodsColumn.setHeat(new GoodsColumnHeat(goodsColumnPO.getView(), goodsColumnPO.getUniqueView()));
        return goodsColumn;
    }

    public static List<GoodsColumn> mulConvertGoodsColumnFromPO(List<GoodsColumnPO> goodsColumnPOList) {
        List<GoodsColumn> goodsColumnList = new ArrayList<>();
        for (GoodsColumnPO PO : goodsColumnPOList) {
            GoodsColumn DO = GoodsColumnFactory.convertGoodsColumnFromPO(PO);
            goodsColumnList.add(DO);
        }
        return goodsColumnList;
    }
}
