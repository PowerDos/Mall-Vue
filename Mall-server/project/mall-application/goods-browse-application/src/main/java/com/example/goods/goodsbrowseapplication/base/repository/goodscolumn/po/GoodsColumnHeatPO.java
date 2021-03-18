package com.example.goods.goodsbrowseapplication.base.repository.goodscolumn.po;

import lombok.Data;

/**
 * 商品栏目热度PO
 *
 * <p>商品栏目热度PO</p>
 *
 * @author WuHao
 * @since 2021/3/16 14:10
 */
@Data
public class GoodsColumnHeatPO {
    /**
     * 浏览量
     */
    private Integer view;

    /**
     * 不同用户的浏览量
     */
    private Integer uniqueView;
}
