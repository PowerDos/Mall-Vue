package com.example.goods.goodsbrowseapplication.application.goodsspece.dto;

import lombok.Data;

@Data
public class SpecsGoodsInfoDTO {
    /**
     * 商品Id
     */
    private String goodsId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品图片
     */
    private String img;

    /**
     * 商品描述
     */
    private String describe;
}