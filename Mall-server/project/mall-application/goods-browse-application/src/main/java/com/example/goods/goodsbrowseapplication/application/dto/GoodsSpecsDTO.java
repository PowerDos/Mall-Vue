package com.example.goods.goodsbrowseapplication.application.dto;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SpecsInfo;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.GoodsSpecs;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品规格DTO对象
 *
 * <p>商品规格DTO对象</p>
 *
 * @author WuHao
 * @since 2021/3/4 11:39
 */
public class GoodsSpecsDTO {
    /**
     * 规格Id
     */
    private String specsId;

    /**
     * 规格键Id
     */
    private String specsKeyId;

    /**
     * 规格键名称
     */
    private String specsKeyName;

    /**
     * 规格可选值
     */
    private List<AvailableSpecsKeyPO> specsValue;

    public static class AvailableSpecsKeyPO {

        private String specsValueId;

        private String specsValueName;
    }

    public static GoodsSpecsDTO convertFromDO(GoodsCategory goodsCategory) {
        GoodsSpecsDTO goodsCategoryDTO = new GoodsSpecsDTO();
        return goodsCategoryDTO;
    }

    public static List<GoodsSpecsDTO> convertFromDO(List<GoodsCategory> goodsCategoryList) {
        List<GoodsSpecsDTO> goodsSpecsDTOList = new ArrayList<>();
        goodsCategoryList.forEach(goodsCategory -> goodsSpecsDTOList.add(convertFromDO(goodsCategory)));
        return goodsSpecsDTOList;
    }
}
