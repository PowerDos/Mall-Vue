package com.example.goods.goodsbrowseapplication.base.repository.goodscategory;

import com.example.goods.goodsbrowseapplication.base.repository.goodscategory.po.GoodsCategoryPO;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.repository.GoodsCategoryRepository;
import com.example.mallcommon.lazyload.target.TargetEnhancer;
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
public class MysqlMybatisGoodsCategoryRepositoryImpl implements GoodsCategoryRepository {

    @Autowired
    private ObjectFactory<TargetEnhancer> containerFactory;
    @Autowired
    private GoodsCategoryMapper goodsCategoryMapper;

    @Override
    public List<GoodsCategory> findAllCategories() {
        List<GoodsCategoryPO> goodsCategoryPOList = goodsCategoryMapper.lazyFindAll();
        List<GoodsCategory> goodsCategoryList = new ArrayList<>();
        for (GoodsCategoryPO goodsCategoryPO : goodsCategoryPOList) {
            TargetEnhancer container = containerFactory.getObject();
            goodsCategoryList.add(container.getTarget(goodsCategoryPO,GoodsCategory.class));
        }
        return goodsCategoryList;
    }

    @Override
    public List<GoodsCategory> findByThirdCategoryId(Integer thirdCategoryId) {
        List<GoodsCategoryPO> goodsCategoryPOList = goodsCategoryMapper.LazyFindByThirdCategoryId(thirdCategoryId);
        List<GoodsCategory> goodsCategoryList = new ArrayList<>();
        for (GoodsCategoryPO goodsCategoryPO : goodsCategoryPOList) {
            TargetEnhancer container = containerFactory.getObject();
            goodsCategoryList.add(container.getTarget(goodsCategoryPO,GoodsCategory.class));
        }
        return goodsCategoryList;
    }
}
