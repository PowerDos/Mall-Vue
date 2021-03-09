package com.example.goods.goodsbrowseapplication.domain.goodscategory;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.RootCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SpecsInfo;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SubCategoryInfo;
import lombok.Data;

import java.util.List;

/**
 * 商品类别
 *
 * <p>商品类别</p>
 *
 * @author WuHao
 * @since 2021/3/3 9:51
 */
@Data
public class GoodsCategory {

    /**
     * 商品根类别
     */
    private RootCategory rootCategory;

    /**
     * 根类别下的子类
     */
    private SubCategoryInfo subCategoryInfo;

    /**
     * 子类别下的商品规格信息
     */
    private List<SpecsInfo> specsInfo;

}
