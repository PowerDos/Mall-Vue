package com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author WuHao
 * @Description: 商品栏目热度
 * @since 2021/2/21 17:57
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class GoodsColumnHeat {
    /**
     * 浏览量
     */
    private Integer view;

    /**
     * 不同用户的浏览量
     */
    private Integer uniqueView;

}
