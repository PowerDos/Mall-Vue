package com.example.goods.goodsbrowseapplication.domain.goodscategory.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 商品类别下的规格信息
 *
 * <p>商品类别下的规格信息</p>
 *
 * @author WuHao
 * @since 2021/3/3 10:00
 */
@Data
public class SpecsInfo implements Serializable {

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
    private List<AvailableSpecsKey> specsValue;

    @Data
    public static class AvailableSpecsKey implements Serializable{

        private String specsValueId;

        private String specsValueName;
    }
}
