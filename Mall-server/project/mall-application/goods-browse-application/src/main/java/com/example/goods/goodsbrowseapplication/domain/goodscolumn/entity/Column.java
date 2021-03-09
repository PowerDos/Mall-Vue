package com.example.goods.goodsbrowseapplication.domain.goodscolumn.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author WuHao
 * @Description: 商城首页中的商品栏目
 * @since 2021/2/21 17:37
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Column {

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

}
