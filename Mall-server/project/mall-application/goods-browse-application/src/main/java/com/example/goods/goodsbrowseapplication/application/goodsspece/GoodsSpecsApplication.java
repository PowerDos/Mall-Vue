package com.example.goods.goodsbrowseapplication.application.goodsspece;

import com.example.goods.goodsbrowseapplication.domain.goodsspecs.GoodsSpecs;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.service.GoodsSpecsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品规格应用服务
 *
 * <p>商品规格应用服务</p>
 *
 * @author WuHao
 * @since 2021/4/1 15:39
 */
@Service
public class GoodsSpecsApplication {

    @Autowired
    private GoodsSpecsService goodsSpecsService;

    public GoodsSpecs getGoodsSpecsPOByCategoryAndSpecsValues(String thirdCategoryId, List<String> specsValues) {
        return goodsSpecsService.getGoodsSpecsPOByCategoryAndSpecsValues(thirdCategoryId, specsValues);
    }
}
