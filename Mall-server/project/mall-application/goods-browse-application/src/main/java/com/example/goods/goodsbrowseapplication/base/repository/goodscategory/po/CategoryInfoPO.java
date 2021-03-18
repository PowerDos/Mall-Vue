package com.example.goods.goodsbrowseapplication.base.repository.goodscategory.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 商品根类别下的子类别信息
 *
 * <p>商品根类别下的子类别信息</p>
 *
 * @author WuHao
 * @since 2021/3/3 10:00
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryInfoPO {

    /**
     * 根类别id
     */
    private String rootCategoryId;

    /**
     * 根类别名
     */
    private String rootCategoryName;

    /**
     * 二级类别id
     */
    private String secCategoryId;

    /**
     * 二级类别名称
     */
    private String secCategoryName;

    /**
     * 三级类别id
     */
    private String thirdCategoryId;

    /**
     * 三级类别名称
     */
    private String thirdCategoryName;
}
