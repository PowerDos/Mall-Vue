package com.example.goods.goodsbrowseapplication.domain.goodscolumn.po;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;
import java.util.List;


/**
 * <p>商品栏目持久化对象</p>
 *
 * @author WuHao
 * @since 2021/3/2 10:18
 */
@Data
@NoArgsConstructor
@ToString
public class GoodsColumnPO {
    /**
     * 栏目ID
     */
    private String columnId;

    /**
     * 栏目名
     */
    private String columnName;

    /**
     * 该栏目是否激活
     */
    private Boolean enable;

    /**
     * 浏览量
     */
    private Integer view;

    /**
     * 不同用户的浏览量
     */
    private Integer uniqueView;

    /**
     * 商品信息
     * @see GoodsInfoInColumnPO
     */
    private List<GoodsInfoInColumnPO> goodsInfoList;

    /**
     * 商品信息持久化对象
     *
     * <p>商品信息持久化对象</p>
     *
     * @author WuHao
     * @since 2021/3/3 15:06
     */
    @Data
    public static class GoodsInfoInColumnPO {

        /**
         * 商品Id
         */
        private String goodsId;

        /**
         * 商品名称
         */
        private String goodsName;

        /**
         * 商品图片
         */
        private String img;

        /**
         * 商品描述
         */
        private String describe;

        /**
         * 在栏目中展示该商品的时间
         */
        private Date showTime;

        /**
         * 在栏目中停止展示该商品的时间
         */
        private Date offTime;
    }

}
