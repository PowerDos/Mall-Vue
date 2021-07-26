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
    private String id;

    /**
     * 类别id
     */
    private Long categoryId;

    /**
     * 类别名
     */
    private String categoryName;

    /**
     * 父类别的类别id
     * @see GoodsCategoryPO#categoryId
     */
    private Long parentCategoryId;
}
