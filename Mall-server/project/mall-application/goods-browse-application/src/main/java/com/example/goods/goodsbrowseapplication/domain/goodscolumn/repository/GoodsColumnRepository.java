package com.example.goods.goodsbrowseapplication.domain.goodscolumn.repository;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;

import java.util.List;

public interface GoodsColumnRepository {

    /**
     * 从持久层查询到所有的激活状态 {@code GoodsColumn.column.enable==true} 的商品栏目信息
     * @return  List<GoodsColumn>
     */
    List<GoodsColumn> findAllWhichEnable();
}
