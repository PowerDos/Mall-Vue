package com.example.goods.goodsbrowseapplication.application.goodsspece;

import com.example.goods.goodsbrowseapplication.application.goodscolumn.dto.GoodsColumnDTO;
import com.example.goods.goodsbrowseapplication.application.goodsspece.dto.GoodsInfoInGoodsSpecsDTO;
import com.example.goods.goodsbrowseapplication.application.goodsspece.dto.SpecsGoodsInfoDTO;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.GoodsSpecs;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.service.GoodsSpecsService;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.valueobject.SpecsGoodsInfo;
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

    public GoodsInfoInGoodsSpecsDTO getGoodsSpecsPOByCategoryAndSpecsValues(String thirdCategoryId, List<String> specsValues) {
        GoodsSpecs goodsSpecsByCategoryAndSpecsValues = goodsSpecsService.getGoodsSpecsByCategoryAndSpecsValues(thirdCategoryId, specsValues);
        return GoodsInfoInGoodsSpecsDTO.convertFromDO(goodsSpecsByCategoryAndSpecsValues);
    }
}
