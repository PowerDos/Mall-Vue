package com.example.goods.goodsbrowseapplication.api;

import com.example.goods.goodsbrowseapplication.application.goodsspece.GoodsSpecsApplication;
import com.example.goods.goodsbrowseapplication.domain.goodsspecs.GoodsSpecs;
import com.example.mallcommon.response.BaseResponse;
import com.example.mallcommon.response.ErrorResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

/**
 * 商品类别接口
 *
 * <p>商品类别接口</p>
 *
 * @author WuHao
 * @since 2021/3/4 11:20
 */
@RestController
@Api(tags = {"商品规格接口"})
@RequestMapping("/goods_category")
@ApiResponses({
        @ApiResponse(code = 200, message = "请求处理成功"),
        @ApiResponse(code = 401, message = "未鉴权的访问"),
        @ApiResponse(code = 403, message = "禁止访问"),
        @ApiResponse(code = 404, message = "请求url错误"),
        @ApiResponse(code = 500, message = "请求处理失败", response = ErrorResponse.class)
})
public class GoodsSpecsApi {

    @Autowired
    private GoodsSpecsApplication goodsSpecsApplication;


    @ApiOperation(value = "根据类别与规格筛选商品", produces = "application/json")
    @GetMapping("/goods_infos")
    public BaseResponse<GoodsSpecs> getGoodsSpecsInfos(String thirdCategoryId, String[] specsValues) {
        return new BaseResponse<>(goodsSpecsApplication.getGoodsSpecsPOByCategoryAndSpecsValues(thirdCategoryId, Arrays.asList(specsValues)));
    }
}
