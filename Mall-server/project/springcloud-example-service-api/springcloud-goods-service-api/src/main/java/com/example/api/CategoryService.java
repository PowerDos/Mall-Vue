package com.example.api;

import com.alibaba.fastjson.JSONObject;
import com.example.global.util.baseResponse.BaseResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;

@Api(tags = "商品种类接口")
public interface CategoryService {
    /**
     * 返回商品的根分类
     *
     * @return BaseResponse<JSONObject>
     * JSONObject example:
     * rootCategoryNameList:["A","B"]
     */
    @ApiOperation(value = "返回商品的根分类")
    @GetMapping("/getGoodsRootCategory")
    BaseResponse<JSONObject> getGoodsRootCategory();

    /**
     * 返回商品的所有分类
     *
     * @return List<JsonObject>
     * JSONObject example：
     * categoriesInfo: {
     * type: '家用电器',
     * detail: {
     * navTags: ['赛事', '运动城', '户外馆', '健身房', '骑行馆', '钟表城'],
     * classNav: [
     * {
     * title: '家电',
     * tags: [{"name":"冰箱","categoryId":1},
     * {"name":"洗衣机","categoryId":2},
     * {"name":"电脑","categoryId":3}]
     * },
     * {
     * title: '数码',
     * tags: [{"name":"相机","categoryId":4},
     * {"name":"DV","categoryId":5},
     * {"name":"...","categoryId":6}]
     * },
     * {
     * title: '手机',
     * tags: [{"name":"小米","categoryId":7},
     * {"name":"苹果","categoryId":8},
     * {"name":"华为","categoryId":9}]
     * }]
     * }
     * }
     */
    @ApiOperation(value = "返回商品的所有分类")
    @GetMapping("/getGoodsCategories")
    BaseResponse<JSONObject> getGoodsCategories();


    /**
     * 返回商品的属性分类
     *
     * @return BaseResponse<JSONObject>
     * JSONObject example:
     * tagsInfo: [
     * {
     * tagName: '品牌',
     * tags: [ '华为(HUAWEI)', '三星(SAMSUNG)' ]
     * },
     * {
     * tagName: '手机配件',
     * tags: [ '手机保护套', '苹果周边']
     * }
     * ]
     */
    @ApiOperation(value = "返回商品的属性分类")
    @GetMapping("/getGoodsAttributes")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "categoryId", value = "商品分类categoryId", required = true, paramType = "header")
    })
    BaseResponse<JSONObject> getGoodsAttributes(@RequestHeader("categoryId")Long categoryId);

}
