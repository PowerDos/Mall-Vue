package com.example.goods.goodsbrowseapplication.application.goodscategory.dto;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SpecsInfo;
import lombok.Data;

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
@Data
public class GoodsSpecsDTO {

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

    @Data
    public static class AvailableSpecsKeyPO {

        private String specsValueId;

        private String specsValueName;
    }

    public static List<GoodsSpecsDTO> convertFromDO(GoodsCategory goodsCategory) {
        List<GoodsSpecsDTO> containSpecsDTOList = new ArrayList<>();
//
//        List<SpecsInfo> specsInfoList = goodsCategory.getSpecsInfo();
//        for (SpecsInfo specsInfo : specsInfoList) {
//            GoodsSpecsDTO goodsCategoryDTO = new GoodsSpecsDTO();
//            goodsCategoryDTO.specsKeyId = specsInfo.getSpecsKeyId();
//            goodsCategoryDTO.specsKeyName = specsInfo.getSpecsKeyName();
//            List<SpecsInfo.AvailableSpecsKey> specsValueList = specsInfo.getSpecsValue();
//            List<AvailableSpecsKeyPO> specsValuePOList = new ArrayList<>();
//            for (SpecsInfo.AvailableSpecsKey availableSpecsKey : specsValueList) {
//                AvailableSpecsKeyPO availableSpecsKeyPO = new AvailableSpecsKeyPO();
//                availableSpecsKeyPO.specsValueId = availableSpecsKey.getSpecsValueId();
//                availableSpecsKeyPO.specsValueName = availableSpecsKey.getSpecsValueName();
//                specsValuePOList.add(availableSpecsKeyPO);
//            }
//            goodsCategoryDTO.specsValue = specsValuePOList;
//            containSpecsDTOList.add(goodsCategoryDTO);
//        }

        return containSpecsDTOList;
    }

    public static List<GoodsSpecsDTO> convertFromDO(List<GoodsCategory> goodsCategoryList) {
        List<GoodsSpecsDTO> goodsSpecsDTOList = new ArrayList<>();
        for (GoodsCategory goodsCategory : goodsCategoryList) {
            List<GoodsSpecsDTO> goodsSpecsDTOList1 = convertFromDO(goodsCategory);
            goodsSpecsDTOList.addAll(goodsSpecsDTOList1);
        }
        return goodsSpecsDTOList;
    }
}
