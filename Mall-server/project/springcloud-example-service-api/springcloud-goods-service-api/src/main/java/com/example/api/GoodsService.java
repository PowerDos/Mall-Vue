package com.example.api;/**
 * @title: MemberService
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2518:48
 */

import com.alibaba.fastjson.JSONObject;
import com.example.global.util.baseResponse.BaseResponse;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/25
 */
@Api(tags = "商品服务接口")
public interface GoodsService {


    /**
     * 返回categoryId下的商品信息
     *
     * @return BaseResponse<JSONObject>
     * JSONObject example:
     * {
     * asItems: [   // 广告信息
     * {
     * img: 'static/img/goodsList/item-as-img-1.jpg',
     * price: 39.9,
     * intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
     * num: 3140,
     * sale: 9000
     * }
     * ],
     * goodsList: [  // 商品信息
     * {
     * img: 'static/img/goodsList/item-show-1.jpg',
     * lowesPrice: 36.60,
     * intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬壳男女磨砂防摔 火影红(苹',
     * comment: 6160,
     * shopName: '元亨利配件专营店',
     * sale: 9900
     * }
     * ]
     * }
     */
    @ApiOperation(value = "返回当前属性分类下的商品信息")
    @GetMapping("/getGoodsLists")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "categoryId", value = "商品分类categoryId", required = true, paramType = "header")
    })
    BaseResponse<JSONObject> getGoodsLists(@RequestHeader("categoryId") Long categoryId);


    @ApiOperation(value = "返回商品搜索的结果")
    @GetMapping("/searchGoodsLists")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "searchStr", value = "查找字符串", required = true, paramType = "header")
    })
    BaseResponse<JSONObject> searchGoodsLists(@RequestHeader String searchStr);


    @ApiOperation(value = "返回商品所有规格，价格的详细信息")
    @GetMapping("/getGoodDetail")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "productId", value = "产品id", required = true, paramType = "header")
    })
    BaseResponse<JSONObject> getGoodDetail(@RequestHeader Long productId);

    @ApiOperation(value = "返回商品所有规格，价格的详细信息")
    @GetMapping("/getGoodDetailSeckill")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "productId", value = "产品id", required = true, paramType = "header"),
            @ApiImplicitParam(name = "specsId", value = "规格id", required = true, paramType = "header")
    })
    BaseResponse<JSONObject> getGoodDetailSeckill(@RequestHeader("productId") Long productId, @RequestHeader("specsId") Long specsId);

    @ApiOperation(value = "商品减库存")
    @PostMapping("/handleGoodStorage")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "transformData", value = "购买信息", required = true, paramType = "body"),
    })
    BaseResponse<JSONObject> handleGoodStorage(@RequestBody String transformData);
}

