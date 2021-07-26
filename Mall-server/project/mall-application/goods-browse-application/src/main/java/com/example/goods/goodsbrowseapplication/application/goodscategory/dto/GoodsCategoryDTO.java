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
    private Long rootCategoryId;

    /**
     * 根类别名
     */
    private String rootCategoryName;

    /**
     * 二级类别
     */
    private List<SecondCategoryDTO> secondCategoryDTOList;


    public static GoodsCategoryDTO convertFromDO(GoodsCategory category) {
        GoodsCategoryDTO goodsCategoryDTO = new GoodsCategoryDTO();
        goodsCategoryDTO.setRootCategoryId(category.getRootCategoryId());
        goodsCategoryDTO.setRootCategoryName(category.getRootCategoryName());
        List<SecondCategoryDTO> secondCategoryDTOList = new ArrayList<>();
        category.getSecondCategoryInfo().forEach(secondCategoryInfo -> {
            SecondCategoryDTO secondCategoryDTO = new SecondCategoryDTO();
            secondCategoryDTO.secCategoryId = secondCategoryInfo.getSecCategoryId();
            secondCategoryDTO.secCategoryName = secondCategoryInfo.getSecCategoryName();
            List<ThirdCategoryDTO> thirdCategoryDTOList = new ArrayList<>();
            secondCategoryInfo.getThirdCategoryInfo().forEach(thirdCategoryInfo -> {
                ThirdCategoryDTO thirdCategoryDTO = new ThirdCategoryDTO();
                thirdCategoryDTO.thirdCategoryId = thirdCategoryInfo.getThirdCategoryId();
                thirdCategoryDTO.thirdCategoryName = thirdCategoryInfo.getThirdCategoryName();
                thirdCategoryDTOList.add(thirdCategoryDTO);
            });
            secondCategoryDTO.thirdCategoryDTOList = thirdCategoryDTOList;
            secondCategoryDTOList.add(secondCategoryDTO);
        });
        goodsCategoryDTO.setSecondCategoryDTOList(secondCategoryDTOList);
        return goodsCategoryDTO;
    }

    @Data
    static class SecondCategoryDTO {

        /**
         * 二级类别id
         */
        private Long secCategoryId;

        /**
         * 二级类别名称
         */
        private String secCategoryName;

        /**
         * 三级类别
         */
        private List<ThirdCategoryDTO> thirdCategoryDTOList;
    }

    @Data
    static class ThirdCategoryDTO {

        /**
         * 三级类别id
         */
        private Long thirdCategoryId;

        /**
         * 三级类别名称
         */
        private String thirdCategoryName;

    }

    public static List<GoodsCategoryDTO> convertFromDO(List<GoodsCategory> categories) {
        List<GoodsCategoryDTO> goodsCategoryDTOList = new ArrayList<>();
        categories.forEach(goodsCategory -> goodsCategoryDTOList.add(convertFromDO(goodsCategory)));
        return goodsCategoryDTOList;
    }
}
