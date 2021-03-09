package com.example.goods.goodsbrowseapplication.api;

import com.example.goods.goodsbrowseapplication.api.facade.GoodsCategoryApiFacadeImpl;
import com.example.goods.goodsbrowseapplication.api.facade.impl.GoodsCategoryApiFacade;
import com.example.goods.goodsbrowseapplication.api.facade.impl.GoodsColumnApiFacade;
import com.example.goods.goodsbrowseapplication.application.GoodsBrowseApplicationService;
import com.example.goods.goodsbrowseapplication.application.dto.GoodsCategoryDTO;
import com.example.goods.goodsbrowseapplication.application.dto.GoodsColumnDTO;
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

import java.util.List;

/**
 * 商品类别接口
 *
 * <p>商品类别接口</p>
 *
 * @author WuHao
 * @since 2021/3/4 11:20
 */
@RestController
@Api(tags = {"商品类别接口"})
@RequestMapping("/goods_category")
@ApiResponses({
        @ApiResponse(code = 200, message = "请求处理成功"),
        @ApiResponse(code = 401, message = "未鉴权的访问"),
        @ApiResponse(code = 403, message = "禁止访问"),
        @ApiResponse(code = 404, message = "请求url错误"),
        @ApiResponse(code = 500, message = "请求处理失败", response = ErrorResponse.class)
})
public class GoodsCategoryApi {

    @Autowired
    private GoodsCategoryApiFacade goodsCategoryApiFacade;
    @Autowired
    private GoodsBrowseApplicationService goodsBrowseApplicationService;

    @ApiOperation(value = "获取所有的商品类别信息", produces = "application/json")
    @GetMapping("/goods_categories")
    public BaseResponse<List<GoodsCategoryDTO>> getGoodsColumns() {
        return new BaseResponse<>(goodsBrowseApplicationService.getCategories());
    }


}
