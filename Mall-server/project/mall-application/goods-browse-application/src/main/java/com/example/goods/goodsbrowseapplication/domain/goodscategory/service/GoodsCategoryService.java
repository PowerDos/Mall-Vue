package com.example.goods.goodsbrowseapplication.domain.goodscategory.service;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.base.repository.goodscategory.po.GoodsCategoryPO;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.repository.GoodsCategoryRepository;
import com.example.mallcommon.lazyload.container.TargetEnhancer;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品类别领域服务
 *
 * <p>商品类别领域服务</p>
 *
 * @author WuHao
 * @since 2021/3/3 14:04
 */
@Service
public class GoodsCategoryService {
    @Autowired
    private GoodsCategoryRepository goodsCategoryRepository;

    /**
     * 获取所有的商品类别信息
     *
     * @return
     */
    public List<GoodsCategory> getCategories() {
        List<GoodsCategory> goodsCategoryList = null;
        try {
            goodsCategoryList = goodsCategoryRepository.findAllCategories();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return goodsCategoryList;
    }


    public List<GoodsCategory> getSpecsInfos(Integer thirdCategoryId) {
        List<GoodsCategory> goodsCategoryList = goodsCategoryRepository.findByThirdCategoryId(thirdCategoryId);

        return goodsCategoryList;
    }
}
