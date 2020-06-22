package com.example.seckill.api;

import com.alibaba.fastjson.JSONObject;
import com.example.api.SecKillService;
import com.example.entitity.DO.SeckillDO;
import com.example.entitity.DO.SeckillGoodDO;
import com.example.seckill.config.RabbitMQConfig;
import com.example.seckill.feign.goods.GoodsFeign;
import com.example.seckill.mapper.SeckillGoodMapper;
import com.example.seckill.mapper.SeckillMapper;
import com.example.global.util.Transaction.Redis_DataBaseTransaction;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import com.example.global.util.constants.Constants;
import com.example.global.util.redis.RedisUtil;
import com.example.global.util.snowFlake.SnowFlakeIdUtil;
import com.example.global.util.tokenGenerate.TokenGenerate;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.TransactionStatus;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.LinkedHashMap;

@RestController
public class SecKillServiceImp extends BaseApiService<JSONObject> implements SecKillService {
    @Autowired
    private TokenGenerate tokenGenerate;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private com.example.seckill.service.SecKillService secKillService;
    @Autowired
    private GoodsFeign goodsFeign;
    @Autowired
    private SeckillMapper seckillMapper;
    @Autowired
    private SeckillGoodMapper seckillGoodMapper;
    @Autowired
    private Redis_DataBaseTransaction transaction;
    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Override
    public BaseResponse<JSONObject> SecKill(String userToken, String secKillId) {
        // 1.参数验证
        String userId = tokenGenerate.getToken(userToken);
        if (userId == null) {
            return setResultError("当前账号未登录！");
        }
        // 2.用户秒杀频率限制 在redis中存放操作记录
        Boolean resultNx = redisUtil.setNx(Constants.SECKILL_WAIT_KEY + userId, secKillId, 10L);
        if (resultNx) {
            return setResultError("操作过于频繁！");
        }
        TransactionStatus transactionStatus = transaction.begin();
        try {
            // 3.将秒杀信息存放到mq中
            JSONObject seckillInfo = new JSONObject();
            String seckillToken = SnowFlakeIdUtil.nextId();
            tokenGenerate.createTokenWithNoSuffix(seckillToken, "wait", Constants.SECKILL_TOKEN_TIMEOUT);
            seckillInfo.put("seckillToken", seckillToken);
            seckillInfo.put("userId", userId);
            seckillInfo.put("seckillId", secKillId);
            rabbitTemplate.convertAndSend(null, RabbitMQConfig.seckillQueue, seckillInfo.toString().getBytes());
            JSONObject responseData = new JSONObject();
            responseData.put("seckillToken", seckillToken);
            transaction.commit(transactionStatus);
            return setResultSuccess(responseData);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                transaction.rollback(transactionStatus);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return setResultError("系统错误");
        }
    }

    @Override
    public BaseResponse<JSONObject> loadSecKillInfo() {
        JSONObject responseData = new JSONObject();
        responseData.put("seckillInfo", secKillService.getSecKillInfo());
        return setResultSuccess(responseData);
    }

    @Override
    public BaseResponse<JSONObject> SecKillDetail(Long seckillId) {
        SeckillDO seckillDO = seckillMapper.getSeckillDOById(seckillId);
        if (seckillDO == null) {
            return setResultError("秒杀活动不在时间段内");
        }
        Long seckillGoodId = seckillDO.getSeckillGoodId();
        SeckillGoodDO seckillGoodDo = seckillGoodMapper.getSeckillGoodDo(seckillGoodId);
        Long productId = seckillGoodDo.getProductId();
        Long specsId = seckillGoodDo.getSpecsId();
        BaseResponse<JSONObject> result = goodsFeign.getGoodDetailSeckill(productId, specsId);
        JSONObject responseData = new JSONObject();
        if (result.getRtnCode() == 200) {
            JSONObject goodDetail = result.getData();
            JSONObject goodDetailDTOJSON = goodDetail.getJSONObject("goodDetail");

            ArrayList<ArrayList<LinkedHashMap>> setMeal = (ArrayList<ArrayList<LinkedHashMap>>) goodDetailDTOJSON.get("setMeal");
            ArrayList<LinkedHashMap> setMeal1 = setMeal.get(0);
            LinkedHashMap mealInfo = setMeal1.get(0);
            mealInfo.put("price", seckillGoodDo.getPrice());
            responseData.put("goodDetail", goodDetailDTOJSON);
        }
        return setResultSuccess(responseData);
    }

    @Override
    public BaseResponse<JSONObject> querysecKilStatue(String seckillToken) {
        JSONObject responseData = new JSONObject();
        String statue = tokenGenerate.getToken(seckillToken);
        if (statue == null) {
            // TODO 这里可能是redis宕机或键超时
            responseData.put("statue", "fail");
            return setResultSuccess(responseData);
        }
        switch (statue) {
            case "wait":
                responseData.put("statue", "wait");
                break;
            case "success":
                responseData.put("statue", "success");
                tokenGenerate.removeToken(seckillToken);
                break;
            case "fail":
                responseData.put("statue", "fail");
                break;
            default:
                break;
        }
        return setResultSuccess(responseData);
    }
}
