package com.example.goods.goodsbrowseapplication.domain.goodscategory.factory;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.RootCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SpecsInfo;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SubCategoryInfo;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.po.GoodsCategoryPO;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品类别DO与PO对象转换工厂
 *
 * <p>商品类别DO与PO对象转换工厂</p>
 *
 * @author WuHao
 * @since 2021/3/3 14:14
 */
public class GoodsCategoryFactory {


    public static List<GoodsCategory> mulConvertGoodsCategoryFromPO(List<GoodsCategoryPO> categoryPOList) {
        List<GoodsCategory> goodsCategoryList = new ArrayList<>();
        categoryPOList.forEach(goodsCategoryPO -> {
            GoodsCategory goodsCategory = new GoodsCategory();

            RootCategory rootCategory = new RootCategory();
            BeanUtils.copyProperties(goodsCategoryPO, rootCategory);
            goodsCategory.setRootCategory(rootCategory);

            SubCategoryInfo subCategoryInfo = new SubCategoryInfo();
            BeanUtils.copyProperties(goodsCategoryPO, subCategoryInfo);
            goodsCategory.setSubCategoryInfo(subCategoryInfo);

            ArrayList<SpecsInfo> goodsSpecsInfo = new ArrayList<>();
            goodsCategoryPO.getSpecsInfo().forEach(specsInfoPO -> {
                SpecsInfo specsInfo = new SpecsInfo();
                BeanUtils.copyProperties(specsInfoPO, specsInfo);
                goodsSpecsInfo.add(specsInfo);
            });
            goodsCategory.setSpecsInfo(goodsSpecsInfo);

            goodsCategoryList.add(goodsCategory);
        });
        return goodsCategoryList;
    }
}
