package com.example.goods.goodsbrowseapplication.domain.goodsspecs.entity;


import com.example.goods.goodsbrowseapplication.domain.goodsspecs.valueobject.SpecsGoodsInfo;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 包含的商品信息
 *
 * <p>包含的商品信息</p>
 *
 * @author WuHao
 * @since 2021/3/3 10:54
 */
@Data
public class GoodsIncluded {

    /**
     * 包含商品信息的集合
     */
    private List<SpecsGoodsInfo> goodsInfoList = new ArrayList<>(3);

}
