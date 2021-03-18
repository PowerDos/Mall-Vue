package com.example.goods.goodsbrowseapplication.base.repository.goodscategory;

import com.example.goods.goodsbrowseapplication.base.repository.goodscategory.po.GoodsCategoryPO;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.repository.GoodsCategoryRepository;
import com.example.mallcommon.lazyload.container.TargetEnhancer;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品类别Repository实现类
 *
 * <p>商品类别Repository实现类</p>
 *
 * @author WuHao
 * @since 2021/3/3 14:41
 */
@Repository
public class GoodsCategoryRepositoryImpl implements GoodsCategoryRepository {

    @Autowired
    private ObjectFactory<TargetEnhancer<Object>> containerFactory;
    @Autowired
    private GoodsCategoryMapper goodsCategoryMapper;

    @Override
    public List<GoodsCategory> findAllCategories() {
        List<GoodsCategory> goodsCategoryList = new ArrayList<>();
        List<GoodsCategoryPO> goodsCategoryPOList = goodsCategoryMapper.findAll();
        for (GoodsCategoryPO goodsCategoryPO : goodsCategoryPOList) {
            TargetEnhancer<Object> container = containerFactory.getObject();
            container.initialize(goodsCategoryPO, GoodsCategory.class);
            goodsCategoryList.add((GoodsCategory) container.getTarget());
        }
        return goodsCategoryList;
    }

    @Override
    public List<GoodsCategory> findByThirdCategoryId(Integer thirdCategoryId) {
//        List<GoodsCategoryPO> goodsCategoryPOList = goodsCategoryMapper.findSpecsInfoByCategoryId(thirdCategoryId);

        System.out.println("??!");
        return null;
//        List<GoodsCategoryPO> allCategories = new ArrayList<>();
//        GoodsCategoryPO goodsCategoryPO = new GoodsCategoryPO();
//        goodsCategoryPO.setSpecsInfo(goodsCategoryPOList);
//        allCategories.add(goodsCategoryPO);
//
//        List<GoodsCategory> goodsCategoryList = new ArrayList<>();
//        for (GoodsCategoryPO goodsCategoryPO1 : allCategories) {
//            TargetEnhancer<Object> container = containerFactory.getObject();
//            container.initialize(goodsCategoryPO1, GoodsCategory.class);
//            goodsCategoryList.add((GoodsCategory) container.getTarget());
//        }
//        return goodsCategoryList;
    }
}
