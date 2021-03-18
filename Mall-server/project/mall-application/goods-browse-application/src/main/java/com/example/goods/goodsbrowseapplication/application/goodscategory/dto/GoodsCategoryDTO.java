package com.example.goods.goodsbrowseapplication.application.goodscategory.dto;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * 商品类别DTO对象
 *
 * <p>商品类别DTO对象</p>
 *
 * @author WuHao
 * @since 2021/3/4 11:05
 */
@Data
public class GoodsCategoryDTO {
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


    public static GoodsCategoryDTO convertFromDO(GoodsCategory category) {
        GoodsCategoryDTO goodsCategoryDTO = new GoodsCategoryDTO();
        goodsCategoryDTO.setRootCategoryId(category.getRootCategory().getRootCategoryId());
        goodsCategoryDTO.setRootCategoryName(category.getRootCategory().getRootCategoryName());
        goodsCategoryDTO.setSecCategoryId(category.getSubCategoryInfo().getSecCategoryId());
        goodsCategoryDTO.setSecCategoryName(category.getSubCategoryInfo().getSecCategoryName());
        goodsCategoryDTO.setThirdCategoryId(category.getSubCategoryInfo().getThirdCategoryId());
        goodsCategoryDTO.setThirdCategoryName(category.getSubCategoryInfo().getThirdCategoryName());
        return goodsCategoryDTO;
    }

    public static List<GoodsCategoryDTO> convertFromDO(List<GoodsCategory> categories) {
        List<GoodsCategoryDTO> goodsCategoryDTOList = new ArrayList<>();
        categories.forEach(goodsCategory -> goodsCategoryDTOList.add(convertFromDO(goodsCategory)));
        return goodsCategoryDTOList;
    }
}
