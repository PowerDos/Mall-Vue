package com.example.goods.goodsbrowseapplication.base.repository.goodscategory.po;

import lombok.Data;

import java.util.List;

/**
 * 商品类别持久化对象
 *
 * <p>商品类别持久化对象</p>
 *
 * @author WuHao
 * @since 2021/3/3 14:13
 */
@Data
public class GoodsCategoryPO  {

    /**
     * 类别
     */
    private CategoryInfoPO categoryInfoPO;

    /**
     * 子类别下的商品规格信息
     */
    private List<SpecsInfoPO> specsInfo;
}
