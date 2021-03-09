package com.example.goods.goodsbrowseapplication.domain.goodscategory.repository;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.po.GoodsCategoryPO;

import java.util.List;

public interface GoodsCategoryRepository {

    List<GoodsCategoryPO> findAllCategories();
}
