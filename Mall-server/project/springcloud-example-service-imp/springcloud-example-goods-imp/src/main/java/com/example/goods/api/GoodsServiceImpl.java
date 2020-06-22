package com.example.goods.api;

import com.alibaba.fastjson.JSONObject;
import com.example.api.GoodsService;
import com.example.entitity.DO.GoodSpecsDO;
import com.example.goods.mapper.GoodSpecsMapper;
import com.example.global.util.Transaction.DataBaseTransaction;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.TransactionStatus;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

@RestController
public class GoodsServiceImpl extends BaseApiService<JSONObject> implements GoodsService {

    @Autowired
    private com.example.goods.service.GoodsService goodsService;
    @Autowired
    private GoodSpecsMapper goodSpecsMapper;
    @Autowired
    private DataBaseTransaction transaction;

    @Override
    public BaseResponse<JSONObject> getGoodsLists(Long categoryId) {
        JSONObject responseData = new JSONObject();
        responseData.put("productsInfo", goodsService.getGoodsProducts(categoryId));
        return setResultSuccess(responseData);
    }

    @Override
    public BaseResponse<JSONObject> searchGoodsLists(String searchStr) {
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
    public BaseResponse<JSONObject> getGoodDetail(Long productId) {
        JSONObject responseData = new JSONObject();
        responseData.put("goodDetail", goodsService.getGoodDetail(productId));
        return setResultSuccess(responseData);
    }

    @Override
    public BaseResponse<JSONObject> getGoodDetailSeckill(Long productId, Long specsId) {
        JSONObject responseData = new JSONObject();
        responseData.put("goodDetail", goodsService.getGoodDetailSeckill(productId, specsId));
        return setResultSuccess(responseData);
    }

    @Override
    public BaseResponse<JSONObject> handleGoodStorage(String transformData) {
        TransactionStatus transactionStatus = transaction.begin();
        try {
            List<JSONObject> bugInfos = JSONObject.parseObject(transformData, List.class);
            for (JSONObject bugInfo : bugInfos) {
                Long specsId = bugInfo.getLong("specsId");
                Long count = bugInfo.getLong("count");
                GoodSpecsDO goodSpecsDO = goodSpecsMapper.getGoodSpecsDO(specsId);
                Long vision = goodSpecsDO.getRevision();
                int result = goodSpecsMapper.bugGood(specsId, count, vision);
                if (result <= 0) {
                    transaction.rollback(transactionStatus);
                    return setResultError("fail");
                }
            }
            transaction.commit(transactionStatus);
            return setResultSuccess("success");
        } catch (Exception e) {
            try {
                transaction.rollback(transactionStatus);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            return setResultError("fail");
        }
    }
}