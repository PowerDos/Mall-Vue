package com.example.goods.goodsbrowseapplication.base.repository.goodscolumn.po;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;
import java.util.List;


/**
 * <p>商品栏目持久化对象</p>
 *
 * @author WuHao
 * @since 2021/3/2 10:18
 */
@Data
@NoArgsConstructor
@ToString
public class ColumnPO {
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
