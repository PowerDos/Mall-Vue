package com.example.goods.goodsbrowseapplication.domain.goodscolumn.factory;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.entity.Column;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.po.GoodsColumnPO;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsColumnHeat;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsInfoInGoodsColumn;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>商品栏目DO与PO对象转换工厂</p>
 *
 * @author WuHao
 * @since 2021/3/2 10:20
 */
public class GoodsColumnFactory {

    /**
     * 注意： 这里的GoodsColumn与GoodsColumnPO不是一对一的关系！
     *
     * @param goodsColumnPOList 从仓储获取到的GoodsColumnPO对象集合
     * @return 解析后的GoodsColumn对象集合
     */
    public static List<GoodsColumn> mulConvertGoodsColumnFromPO(List<GoodsColumnPO> goodsColumnPOList) {
        List<GoodsColumn> goodsColumnList = new ArrayList<>();
        for (GoodsColumnPO PO : goodsColumnPOList) {
            GoodsColumn DO = GoodsColumnFactory.convertGoodsColumnFromPO(PO);
            goodsColumnList.add(DO);
        }
        return goodsColumnList;
    }

    private static GoodsColumn convertGoodsColumnFromPO(GoodsColumnPO goodsColumnPO) {
        GoodsColumn goodsColumn = new GoodsColumn();

        goodsColumn.setColumn(new Column());
        goodsColumn.setHeat(new GoodsColumnHeat());
        goodsColumn.setGoodsInfo(new GoodsInfoInGoodsColumn());

        BeanUtils.copyProperties(goodsColumnPO, goodsColumn.getColumn());
        BeanUtils.copyProperties(goodsColumnPO, goodsColumn.getHeat());


        goodsColumnPO.getGoodsInfoList().forEach(goodsInfoInColumnPO -> {
            GoodsInfoInGoodsColumn.GoodsInfo goodsInfo = new GoodsInfoInGoodsColumn.GoodsInfo();
            BeanUtils.copyProperties(goodsInfoInColumnPO, goodsInfo);
            goodsColumn.getGoodsInfo().getGoodsInfoList().add(goodsInfo);
        });

        return goodsColumn;
    }
}
