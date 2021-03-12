package com.example.goods.goodsbrowseapplication.api;

import com.example.goods.goodsbrowseapplication.api.facade.impl.GoodsColumnApiFacade;
import com.example.goods.goodsbrowseapplication.application.GoodsBrowseApplicationService;
import com.example.goods.goodsbrowseapplication.application.dto.GoodsColumnDTO;
import com.example.mallcommon.Source;
import com.example.mallcommon.Target;
import com.example.mallcommon.lazyload.TargetEnhancerContainer;
import com.example.mallcommon.response.BaseResponse;
import com.example.mallcommon.response.ErrorResponse;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>商品栏目接口</p>
 *
 * @author WuHao
 * @since 2021/3/2 10:45
 */
@RestController
@Api(tags = {"商品栏目接口"})
@RequestMapping("/goods_column")
@ApiResponses({
        @ApiResponse(code = 200, message = "请求处理成功"),
        @ApiResponse(code = 401, message = "未鉴权的访问"),
        @ApiResponse(code = 403, message = "禁止访问"),
        @ApiResponse(code = 404, message = "请求url错误"),
        @ApiResponse(code = 500, message = "请求处理失败", response = ErrorResponse.class)
})
public class GoodsColumnApi {
//    @Autowired
//    private TargetEnhancerContainer<Object> container;
    @Autowired
    private GoodsColumnApiFacade goodsColumnApiFacade;
    @Autowired
    private GoodsBrowseApplicationService goodsBrowseApplicationService;

    @ApiOperation(value = "获取所有的商品栏目信息", produces = "application/json")
    @GetMapping("/goods_columns")
    public BaseResponse<List<GoodsColumnDTO>> getGoodsColumns() {
        return new BaseResponse<>(goodsBrowseApplicationService.browseColumns());
    }


    @GetMapping("/test")
    public String test() {
//        Source source = new Source();
//        source.setA(1);
//        List<String> aList = new ArrayList<>();
//        aList.add("hello");
//        source.setList(aList);
//        container.initialize(source, Target.class);
//
//        Target target = (Target) container.getTarget();
//        Integer a = target.getA();
//        System.out.println(a);
//        List<String> list = target.getList();
//        System.out.println(list);
        return "success";
    }
}
