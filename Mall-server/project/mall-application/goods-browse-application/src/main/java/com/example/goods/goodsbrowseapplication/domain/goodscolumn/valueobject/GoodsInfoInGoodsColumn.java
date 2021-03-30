package com.example.goods.goodsbrowseapplication.domain.goodscolumn.valueobject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author WuHao
 * @Description: 商品栏目中的商品信息
 * @since 2021/2/21 17:50
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class GoodsInfoInGoodsColumn {
    /**
     * 包含商品信息的集合
     */
    private List<GoodsInfo> goodsInfoList = new ArrayList<>(3);

    /**
     * 商品信息
     */
    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class GoodsInfo {
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

    /**
     * 浏览当前正在展示时间内的商品信息
     *
     */
    public void browseGoodsInfo() {
        List<GoodsInfo> onShowGoodsInfos = new ArrayList<>();
        Date now = new Date();
        for (GoodsInfo goodsInfo : getGoodsInfoList()) {
            if (goodsInfo.showTime.before(now) && goodsInfo.offTime.after(now)) { // 该商品在展示时间内
                onShowGoodsInfos.add(goodsInfo);
            }
        }
        this.goodsInfoList = onShowGoodsInfos;
    }
}
