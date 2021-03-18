package com.example.goods.goodsbrowseapplication.domain.goodscategory.repository;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;

import java.util.List;

public interface GoodsCategoryRepository {

    List<GoodsCategory> findAllCategories();

    List<GoodsCategory> findByThirdCategoryId(Integer thirdCategoryId);
}
