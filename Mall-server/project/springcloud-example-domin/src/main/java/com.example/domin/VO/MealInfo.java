package com.example.domin.VO;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value = "商品规格详情")
public class MealInfo {
    //      mealInfo.put("img", goodSpecsDO.getSmallImg());
//                mealInfo.put("intro", goodSpecsDO.getIntro());
//                mealInfo.put("price", goodSpecsDO.getPrice());
//                mealInfo.put("specsId", SpecsIdStr);

    /**
     * 规格对应缩略图
     */
    @ApiModelProperty(value = "规格对应缩略图")
    private String img;

    /**
     * 规格介绍
     */
    @ApiModelProperty(value = "规格介绍")
    private String intro;

    /**
     * 相应价格
     */
    @ApiModelProperty(value = "相应价格")
    private Float price;

    /**
     * 规格id
     */
    @ApiModelProperty(value = "规格id")
    private Long specsId;
}
