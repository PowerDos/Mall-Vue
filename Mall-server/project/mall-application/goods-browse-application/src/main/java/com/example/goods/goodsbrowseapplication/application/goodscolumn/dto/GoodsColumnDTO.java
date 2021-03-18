package com.example.goods.goodsbrowseapplication.application.goodscolumn.dto;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject.GoodsInfoInGoodsColumn;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

/**
 * @author WuHao
 * @Description: 一个商品栏目信息DTO
 * @since 2021/2/27 17:34
 */
@Data
@ToString
@AllArgsConstructor
public class GoodsColumnDTO {
    private String columnId;

    private String columnName;

    private List<GoodsInfoDTO> goodsInfoDTOList;

    private Integer views;

    private Integer uniqueViews;

    /**
     * 商品信息
     */
    @AllArgsConstructor
    @Data
    public static class GoodsInfoDTO {

        /**
         * 商品Id
         */
        private String goodsId;

        /**
         * 商品名称
         */
        private String goodsName;

    }

    public static GoodsColumnDTO convertFromDO(GoodsColumn goodsColumn) {
        List<GoodsInfoDTO> goodsInfoDTOList = new ArrayList<>();
        for (GoodsInfoInGoodsColumn.GoodsInfo goodsInfo : goodsColumn.getGoodsInfo().getGoodsInfoList()) {
            goodsInfoDTOList.add(new GoodsInfoDTO(goodsInfo.getGoodsId(), goodsInfo.getGoodsName()));
        }
        return new GoodsColumnDTO(goodsColumn.getColumn().getColumnId(), goodsColumn.getColumn().getColumnName(),
                goodsInfoDTOList, goodsColumn.getHeat().getView(), goodsColumn.getHeat().getUniqueView());
    }

    public static List<GoodsColumnDTO> convertFromDO(List<GoodsColumn> goodsColumnList) {
        List<GoodsColumnDTO> goodsColumnDTOList = new ArrayList<>();
        for (GoodsColumn column : goodsColumnList) {
            GoodsColumnDTO goodsColumnDTO = convertFromDO(column);
            goodsColumnDTOList.add(goodsColumnDTO);
        }
        return goodsColumnDTOList;
    }

}
