package com.example.goods.goodsbrowseapplication.domain.goodsspecs.service;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.repository.GoodsColumnRepository;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.GoodsSpecs;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.repository.GoodsSpecsRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品栏规格领域服务
 *
 * <p>商品栏规格领域服务，用于完成多聚合间的处理或者涉及到base层操作</p>
 *
 * @author WuHao
 * @since 2021/4/1 15:31
 */
@Service
public class GoodsSpecsService {

    @Autowired
    private GoodsSpecsRepository goodsSpecsRepository;

    public GoodsSpecs getGoodsSpecsPOByCategoryAndSpecsValues(String thirdCategoryId, List<String> specsValues) {
        String categoryAndSpecsValuesCombineStr = thirdCategoryId + "." + StringUtils.join(specsValues, ",");
        return goodsSpecsRepository.selectGoodsSpecsPOByCategoryAndSpecsValuesCombineStr(categoryAndSpecsValuesCombineStr);
    }

}
