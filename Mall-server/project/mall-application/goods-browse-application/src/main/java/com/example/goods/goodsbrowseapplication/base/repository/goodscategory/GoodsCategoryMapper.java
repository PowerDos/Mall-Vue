package com.example.goods.goodsbrowseapplication.base.repository.goodscategory;

import com.example.goods.goodsbrowseapplication.base.repository.goodscategory.po.GoodsCategoryPO;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GoodsCategoryMapper {

    @Select("select * from goods_category where parent_category_id=#{parentCategoryId}")
    List<GoodsCategoryPO> selectByParentCategoryId(Long parentCategoryId);
}
