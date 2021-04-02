package com.example.goods.goodsbrowseapplication.base.repository.goodsspecs.po;


import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品规格信息PO
 *
 * <p>商品规格信息PO</p>
 *
 * @author WuHao
 * @since 2021/4/1 13:22
 */
@Data
public class GoodsSpecsPO {
    /**
     * 商品类别和可选规格value_id的组合字符串，如3.1,2,3表明3类别下选中1，2，3specs_value的选择条件
     */
    private String categoryAndSpecsValuesCombineStr;

    /**
     * 包含商品信息的集合
     */
    private List<SpecsGoodsInfoPO> goodsInfoList = new ArrayList<>(3);
}
