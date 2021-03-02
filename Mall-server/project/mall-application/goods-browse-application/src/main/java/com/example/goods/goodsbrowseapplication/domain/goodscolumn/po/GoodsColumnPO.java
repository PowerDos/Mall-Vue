package com.example.goods.goodsbrowseapplication.domain.goodscolumn.po;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
 * <p>商品栏目持久化对象</p>
 *
 * @author WuHao
 * @since 2021/3/2 10:18
 */
@Data
@NoArgsConstructor
@ToString
public class GoodsColumnPO {
    /**
     * 栏目ID
     */
    private String columnId;

    /**
     * 栏目名
     */
    private String columnName;

    /**
     * 该栏目是否激活
     */
    private Boolean enable;

    /**
     * 浏览量
     */
    private Integer view;

    /**
     * 不同用户的浏览量
     */
    private Integer uniqueView;

    /**
     * 商品信息JSON串
     */
    private String goodsInfoList;
}
