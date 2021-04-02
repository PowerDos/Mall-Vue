package com.example.goods.goodsbrowseapplication.domain.goodsspecs.entity;

import lombok.Data;

import java.util.List;
import java.util.Map;

/**
 * 商品类别下选择的规格信息
 *
 * <p>商品类别下选择的规格信息</p>
 *
 * @author WuHao
 * @since 2021/3/3 10:52
 */
@Data
public class SelectedSpecsInCategory {

    /**
     * 三级类别id
     */
    private String thirdCategoryId;

    /**
     * 已选择的规格信息
     */
    private List<String> specsValueIdList;

}
