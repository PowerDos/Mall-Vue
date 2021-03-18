package com.example.goods.goodsbrowseapplication.base.repository.goodscolumn.po;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品信息持久化对象
 *
 * <p>商品信息持久化对象</p>
 *
 * @author WuHao
 * @since 2021/3/3 15:06
 */
@Data
public class GoodsInfoInColumnPO {

    /**
     * 包含商品信息的集合
     */
    private List<GoodsInfoPO> goodsInfoList = new ArrayList<>(3);


}