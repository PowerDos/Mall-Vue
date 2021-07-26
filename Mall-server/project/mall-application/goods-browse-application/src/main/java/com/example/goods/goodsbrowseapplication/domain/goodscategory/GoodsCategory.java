package com.example.goods.goodsbrowseapplication.domain.goodscategory;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.entity.SecondCategoryInfo;
import lombok.Data;

import java.util.List;

/**
 * 商品类别
 *
 * <p>商品类别</p>
 *
 * @author WuHao
 * @since 2021/3/3 9:51
 */
@Data
public class GoodsCategory {

    /**
     * 根类别id
     */
    private Long rootCategoryId;

    /**
     * 根类别名
     */
    private String rootCategoryName;

    /**
     * 根类别下的二级类别
     */
    private List<SecondCategoryInfo> secondCategoryInfo;

}
