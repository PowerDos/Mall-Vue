package com.example.goods.goodsbrowseapplication.domain.goodscategory.po;

import lombok.Data;

import java.io.Serializable;
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
public class GoodsCategoryPO implements Serializable {

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

    /**
     * 子类别下的商品规格信息
     *
     * @see SpecsInfoPO
     */
    private List<SpecsInfoPO> specsInfo;

    /**
     * 商品类别下的商品规格信息持久化对象
     *
     * <p>商品类别下的商品规格信息持久化对象</p>
     *
     * @author WuHao
     * @since 2021/3/4 9:17
     */
    @Data
    public static class SpecsInfoPO implements Serializable{
        /**
         * 规格Id
         */
        private String specsId;

        /**
         * 规格键Id
         */
        private String specsKeyId;

        /**
         * 规格键名称
         */
        private String specsKeyName;

        /**
         * 规格可选值
         */
        private List<AvailableSpecsKeyPO> specsValue;
    }
    @Data
    public static class AvailableSpecsKeyPO implements Serializable{

        private String specsValueId;

        private String specsValueName;
    }
}
