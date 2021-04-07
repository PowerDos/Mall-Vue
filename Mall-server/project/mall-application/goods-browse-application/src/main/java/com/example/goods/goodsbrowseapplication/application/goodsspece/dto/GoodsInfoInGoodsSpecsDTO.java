package com.example.goods.goodsbrowseapplication.application.goodsspece.dto;

import com.example.goods.goodsbrowseapplication.base.repository.goodsspecs.po.SpecsGoodsInfoPO;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.GoodsSpecs;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.valueobject.SpecsGoodsInfo;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 根据类别和规格筛选商品返回DTO
 *
 * <p>根据类别和规格筛选商品返回DTO</p>
 *
 * @author WuHao
 * @since 2021/4/7 9:33
 */
@Data
public class GoodsInfoInGoodsSpecsDTO {
    /**
     * 包含商品信息的集合
     */
    private List<SpecsGoodsInfoDTO> goodsInfoList = new ArrayList<>(3);


    public static GoodsInfoInGoodsSpecsDTO convertFromDO(GoodsSpecs goodsSpecsByCategoryAndSpecsValues) {
        List<SpecsGoodsInfo> goodsInfoList = goodsSpecsByCategoryAndSpecsValues.getGoodsIncluded().getGoodsInfoList();
        List<SpecsGoodsInfoDTO> goodsInfoDTOList = new ArrayList<>();
        for (SpecsGoodsInfo goodsInfo : goodsInfoList) {
            SpecsGoodsInfoDTO specsGoodsInfoDTO = new SpecsGoodsInfoDTO();
            specsGoodsInfoDTO.setGoodsId(goodsInfo.getGoodsId());
            specsGoodsInfoDTO.setGoodsName(goodsInfo.getGoodsName());
            specsGoodsInfoDTO.setImg(goodsInfo.getGoodsImg());
            specsGoodsInfoDTO.setDescribe(goodsInfo.getGoodsDescribe());
            goodsInfoDTOList.add(specsGoodsInfoDTO);
        }
        GoodsInfoInGoodsSpecsDTO goodsInfoInGoodsSpecsDTO = new GoodsInfoInGoodsSpecsDTO();
        goodsInfoInGoodsSpecsDTO.setGoodsInfoList(goodsInfoDTOList);
        return goodsInfoInGoodsSpecsDTO;
    }
}
