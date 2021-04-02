package com.example.goods.goodsbrowseapplication.domain.goodsspecs.repository;

import com.example.goods.goodsbrowseapplication.domain.goodsspecs.GoodsSpecs;


public interface GoodsSpecsRepository {

    /**
     * 根据商品类别和可选规格来查询GoodsSpecs
     *
     * @return  GoodsSpecs
     */
    GoodsSpecs selectGoodsSpecsPOByCategoryAndSpecsValuesCombineStr(String categoryAndSpecsValuesCombineStr);
}
