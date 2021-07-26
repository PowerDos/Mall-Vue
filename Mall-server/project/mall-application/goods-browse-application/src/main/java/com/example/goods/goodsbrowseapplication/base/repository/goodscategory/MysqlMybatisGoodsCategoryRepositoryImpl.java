package com.example.goods.goodsbrowseapplication.base.repository.goodscategory;

import com.example.goods.goodsbrowseapplication.base.repository.goodscategory.po.GoodsCategoryPO;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SecondCategoryInfo;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.ThirdCategoryInfo;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.repository.GoodsCategoryRepository;
import com.example.mallcommon.lazyload.targetenhancer.TargetEnhancer;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
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

//    @Autowired
//    private ObjectFactory<TargetEnhancer> containerFactory;
    @Resource
    private GoodsCategoryMapper goodsCategoryMapper;

    @Override
    public List<GoodsCategory> findAllCategories() {
        List<GoodsCategory> goodsCategoryList = new ArrayList<>();
        List<GoodsCategoryPO> rootCategoryPOList = goodsCategoryMapper.selectByParentCategoryId(0L);
        rootCategoryPOList.forEach(rootCategoryPO->{
            GoodsCategory goodsCategory = new GoodsCategory();
            goodsCategory.setRootCategoryId(rootCategoryPO.getCategoryId());
            goodsCategory.setRootCategoryName(rootCategoryPO.getCategoryName());
            List<GoodsCategoryPO> secCategoryPOList = goodsCategoryMapper.selectByParentCategoryId(rootCategoryPO.getCategoryId());
            List<SecondCategoryInfo> secondCategoryInfoList = new ArrayList<>();
            secCategoryPOList.forEach(secCategoryPO->{
                SecondCategoryInfo secondCategoryInfo = new SecondCategoryInfo();
                secondCategoryInfo.setSecCategoryId(secCategoryPO.getCategoryId());
                secondCategoryInfo.setSecCategoryName(secCategoryPO.getCategoryName());
                List<GoodsCategoryPO> thirdCategoryPOList = goodsCategoryMapper.selectByParentCategoryId(secCategoryPO.getCategoryId());
                List<ThirdCategoryInfo> thirdCategoryInfoList = new ArrayList<>();
                thirdCategoryPOList.forEach(thirdCategoryPO->{
                    ThirdCategoryInfo thirdCategoryInfo = new ThirdCategoryInfo();
                    thirdCategoryInfo.setThirdCategoryId(thirdCategoryPO.getCategoryId());
                    thirdCategoryInfo.setThirdCategoryName(thirdCategoryPO.getCategoryName());
                    thirdCategoryInfo.setSpecsInfo(null); //TODO
                    thirdCategoryInfoList.add(thirdCategoryInfo);
                });
                secondCategoryInfo.setThirdCategoryInfo(thirdCategoryInfoList);
                secondCategoryInfoList.add(secondCategoryInfo);
            });
            goodsCategory.setSecondCategoryInfo(secondCategoryInfoList);
            goodsCategoryList.add(goodsCategory);
        });
        return goodsCategoryList;
    }

    @Override
    public List<GoodsCategory> findByThirdCategoryId(Integer thirdCategoryId) {
//        List<GoodsCategoryPO> goodsCategoryPOList = goodsCategoryMapper.LazyFindByThirdCategoryId(thirdCategoryId);
        List<GoodsCategory> goodsCategoryList = new ArrayList<>();
//        for (GoodsCategoryPO goodsCategoryPO : goodsCategoryPOList) {
//            TargetEnhancer container = containerFactory.getObject();
//            goodsCategoryList.add(container.getTarget(goodsCategoryPO,GoodsCategory.class));
//        }
        return goodsCategoryList;
    }
}
