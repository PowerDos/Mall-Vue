package com.example.goods.goodsbrowse.domain.valueobject;

import java.util.Date;
import java.util.List;

/**
 * @Author: WuHao
 * @Description: 商品栏目中的商品信息
 * @Date: 2021/2/21 17:50
 */
public class GoodsInfoInGoodsColumn {

    /**
     * 包含商品信息的集合
     */
    private List<GoodsInfo> goodsInfo;

    /**
     * 商品信息
     */
    class GoodsInfo {
        /**
         * 商品Id
         */
        private String goodsId;

        /**
         * 商品名称
         */
        private String goodsName;

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
