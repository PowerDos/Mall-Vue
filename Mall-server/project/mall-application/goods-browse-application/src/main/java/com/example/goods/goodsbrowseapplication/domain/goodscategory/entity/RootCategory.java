package com.example.goods.goodsbrowseapplication.domain.goodscategory.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 商品根类别
 *
 * <p>商品根类别</p>
 *
 * @author WuHao
 * @since 2021/3/3 9:58
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class RootCategory {

    /**
     * 根类别id
     */
    private String rootCategoryId;

    /**
     * 根类别名
     */
    private String rootCategoryName;
}
