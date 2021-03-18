package com.example.goods.goodsbrowseapplication.base.repository.goodscategory.po;

import lombok.Data;

import java.util.List;

/**
 * 商品类别下的商品规格信息持久化对象
 *
 * <p>商品类别下的商品规格信息持久化对象</p>
 *
 * @author WuHao
 * @since 2021/3/4 9:17
 */
@Data
public class SpecsInfoPO {
    /**
     * 规格Id
     */
    private String specsInfoId;

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
}

