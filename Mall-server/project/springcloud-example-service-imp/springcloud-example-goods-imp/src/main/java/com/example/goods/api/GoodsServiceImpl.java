package com.example.goods.api;

import com.alibaba.fastjson.JSONObject;
import com.example.api.GoodsServiceApi;
import com.example.entitity.DO.GoodSpecsDO;
import com.example.api.vo.HandleGoodStorage;
import com.example.goods.mapper.GoodSpecsMapper;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponseStruct;
import com.example.goods.service.GoodsService;
import jdk.nashorn.internal.runtime.regexp.joni.exception.InternalException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

@RestController
public class GoodsServiceImpl extends BaseApiService<JSONObject> implements GoodsServiceApi {

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private GoodSpecsMapper goodSpecsMapper;

    @Override
    public BaseResponseStruct<JSONObject> getGoodsLists(Long categoryId) {
        JSONObject responseData = new JSONObject();
        responseData.put("productsInfo", goodsService.getGoodsProducts(categoryId));
        return setResultSuccess(responseData);
    }

    @Override
    public BaseResponseStruct<JSONObject> searchGoodsLists(String searchStr) {
        try {
            searchStr = URLDecoder.decode(searchStr, "utf-8");
            JSONObject responseData = new JSONObject();
            responseData.put("productsInfo", goodsService.searchGoodsProducts(searchStr));
            return setResultSuccess(responseData);
        } catch (UnsupportedEncodingException e) {
            // 解码错误
            return setResultError("请求编码错误");
        }
    }

    @Override
    public BaseResponseStruct<JSONObject> getGoodDetail(Long productId) {
        JSONObject responseData = new JSONObject();
        responseData.put("goodDetail", goodsService.getGoodDetail(productId));
        return setResultSuccess(responseData);
    }

    @Override
    public BaseResponseStruct<JSONObject> getGoodDetailSeckill(Long productId, Long specsId) {
        JSONObject responseData = new JSONObject();
        responseData.put("goodDetail", goodsService.getGoodDetailSeckill(productId, specsId));
        return setResultSuccess(responseData);
    }

    @Override
    @Transactional
    public BaseResponseStruct<JSONObject> handleGoodStorage(List<HandleGoodStorage> transformData) {
        try {
            for (HandleGoodStorage bugInfo : transformData) {
                Long specsId = bugInfo.getSpecsId();
                Long count = bugInfo.getCount();
                GoodSpecsDO goodSpecsDO = goodSpecsMapper.getGoodSpecsDO(specsId);
                Long vision = goodSpecsDO.getRevision();
                int result = goodSpecsMapper.bugGood(specsId, count, vision);
                if (result <= 0) {
                    throw new IllegalArgumentException("购买数量不能小于0");
                }
            }
            return setResultSuccess("success");
        } catch (Exception e) {
            e.printStackTrace();
            throw new InternalException("服务器内部错误");
        }
    }
}
