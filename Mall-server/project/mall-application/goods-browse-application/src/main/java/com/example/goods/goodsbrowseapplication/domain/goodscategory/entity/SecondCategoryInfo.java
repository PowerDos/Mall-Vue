package com.example.goods.goodsbrowseapplication.domain.goodscategory.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

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
public class SecondCategoryInfo {

    /**
     * 二级类别id
     */
    private Long secCategoryId;

    /**
     * 二级类别名称
     */
    private String secCategoryName;

    /**
     * 二级类别下的三级类别
     */
    private List<ThirdCategoryInfo> thirdCategoryInfo;
}
