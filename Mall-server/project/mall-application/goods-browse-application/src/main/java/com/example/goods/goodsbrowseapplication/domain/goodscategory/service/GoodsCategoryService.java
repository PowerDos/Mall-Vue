package com.example.goods.goodsbrowseapplication.domain.goodscategory.service;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SpecsInfo;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.factory.GoodsCategoryFactory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.po.GoodsCategoryPO;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.repository.GoodsCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        List<GoodsCategoryPO> goodsCategoryPOList = goodsCategoryRepository.findAllCategories();
        List<GoodsCategory> goodsCategoryList = GoodsCategoryFactory.mulConvertGoodsCategoryFromPO(goodsCategoryPOList);
        return goodsCategoryList;
    }


    public List<SpecsInfo> getSpecsInfos(Integer categoryId) {
        return null;
    }
}
