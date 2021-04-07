package com.example.goods.goodsbrowseapplication.base.repository.goodsspecs;

import com.example.goods.goodsbrowseapplication.base.repository.goodsspecs.po.GoodsSpecsPO;
import com.example.goods.goodsbrowseapplication.base.repository.goodsspecs.po.SpecsGoodsInfoPO;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.GoodsSpecs;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.entity.GoodsIncluded;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.entity.SelectedSpecsInCategory;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.repository.GoodsSpecsRepository;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.valueobject.SpecsGoodsInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 商品规格查询实现类
 *
 * <p>商品规格查询实现类</p>
 *
 * @author WuHao
 * @since 2021/4/1 15:23
 */
@Repository
public class GoodsSpecsRepositoryImpl implements GoodsSpecsRepository {

    @Autowired
    private GoodsSpecsMapper goodsSpecsMapper;

    @Override
    public GoodsSpecs selectGoodsSpecsPOByCategoryAndSpecsValuesCombineStr(String categoryAndSpecsValuesCombineStr) {
        GoodsSpecsPO goodsSpecsPO = goodsSpecsMapper.selectGoodsSpecsPOByCategoryAndSpecsValuesCombineStr(categoryAndSpecsValuesCombineStr);
        List<SpecsGoodsInfoPO> goodsInfoPOList = goodsSpecsPO.getGoodsInfoList();
        List<SpecsGoodsInfo> goodsInfoList = new ArrayList<>();
        for (SpecsGoodsInfoPO specsGoodsInfoPO : goodsInfoPOList) {
            SpecsGoodsInfo specsGoodsInfo = new SpecsGoodsInfo();
            specsGoodsInfo.setGoodsDescribe(specsGoodsInfoPO.getGoodsDescribe());
            specsGoodsInfo.setGoodsId(specsGoodsInfoPO.getGoodsId());
            specsGoodsInfo.setGoodsName(specsGoodsInfoPO.getGoodsName());
            specsGoodsInfo.setGoodsImg(specsGoodsInfoPO.getGoodsImg());
            goodsInfoList.add(specsGoodsInfo);
        }
        GoodsIncluded goodsIncluded = new GoodsIncluded();
        goodsIncluded.setGoodsInfoList(goodsInfoList);

        String[] split = categoryAndSpecsValuesCombineStr.split("\\.");
        String thirdCategoryId = split[0];
        List<String> specsValueIdList = new ArrayList<>();
        if (split.length > 1) {
            String[] specsValues = split[1].split(",");
            specsValueIdList = Arrays.asList(specsValues);
        }

        SelectedSpecsInCategory selectedSpecsInCategory = new SelectedSpecsInCategory();
        selectedSpecsInCategory.setThirdCategoryId(thirdCategoryId);
        selectedSpecsInCategory.setSpecsValueIdList(specsValueIdList);

        GoodsSpecs goodsSpecs = new GoodsSpecs();
        goodsSpecs.setGoodsIncluded(goodsIncluded);
        goodsSpecs.setSelectedSpecsInCategory(selectedSpecsInCategory);
        return goodsSpecs;
    }
}
