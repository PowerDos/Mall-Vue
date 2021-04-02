package com.example.goods.goodsbrowseapplication.domain.goodsspecs;

import com.example.goods.goodsbrowseapplication.domain.goodsspecs.entity.GoodsIncluded;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.entity.SelectedSpecsInCategory;
import lombok.Data;

/**
 * 商品规格信息
 *
 * <p>商品规格信息</p>
 *
 * @author WuHao
 * @since 2021/3/3 10:43
 */
@Data
public class GoodsSpecs {

    /**
     * 商品类别下选择的规格信息
     */
    private SelectedSpecsInCategory selectedSpecsInCategory;

    /**
     * 包含的商品信息
     */
    private GoodsIncluded goodsIncluded;

}
