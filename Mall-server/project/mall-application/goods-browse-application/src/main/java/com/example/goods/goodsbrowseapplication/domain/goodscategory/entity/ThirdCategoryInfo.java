package com.example.goods.goodsbrowseapplication.domain.goodscategory.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
public class ThirdCategoryInfo {

    /**
     * 三级类别id
     */
    private Long thirdCategoryId;

    /**
     * 三级类别名称
     */
    private String thirdCategoryName;

    /**
     * 三级类别下的规格信息
     */
    private List<SpecsInfo> specsInfo;
}
