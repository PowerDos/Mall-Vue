package com.example.order.api;

import com.alibaba.fastjson.JSONObject;
import com.example.api.OrderServiceApi;
import com.example.domin.DO.PayTransactionDO;
import com.example.domin.DTO.PayInfoDTOInput;
import com.example.global.util.requestUtil.RequestUtil;
import com.example.order.mapper.PayTransactionMapper;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponseStruct;
import com.example.global.util.constants.Constants;
import com.example.global.util.tokenGenerate.TokenGenerate;
import com.example.order.service.OrderService;
import jdk.nashorn.internal.runtime.regexp.joni.exception.InternalException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class OrderServiceImp extends BaseApiService<JSONObject> implements OrderServiceApi {

    @Autowired
    private PayTransactionMapper payTransactionMapper;
    @Autowired
    private TokenGenerate tokenGenerate;
    @Autowired
    private OrderService orderService;

    @Override
    @Transactional
    public BaseResponseStruct<JSONObject> prePay(PayInfoDTOInput payList, HttpServletRequest request) {
        // 获取用户信息
        String token = RequestUtil.getCookieValue(request, "token");
        if (token == null) {
            return setResultError(BaseResponseStruct.ResponseCode.NOT_SIGN_YET);
        }
        String userId = tokenGenerate.getToken(token);
        try {
            // 2.生成预支付订单
            PayTransactionDO payTransactionDO = orderService.generatePrePayTransaction(payList, userId);
            // 3.插入预支付订单信息
            if (payTransactionMapper.insertPayTransaction(payTransactionDO) < 0) {
                throw new InternalException("系统错误!");
            }
            String id = payTransactionDO.getId().toString();
            // 4.在redis中存放订单支付id并返回支付token
            String payToken = tokenGenerate.createToken(Constants.PAY_TRANSACTION_KEY, id, Constants.PAY_TRANSACTION_TIMEOUT);
            JSONObject resultData = new JSONObject();
            resultData.put("payToken", payToken);
            return setResultSuccess(resultData);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                throw new InternalException("系统错误!");
            } catch (Exception ex) {
                throw new InternalException("系统错误!");
            }
        }
    }


    @Override
    public BaseResponseStruct<JSONObject> loadOrders(String userToken) {
        // 1.验证用户登录状态toke
        String userId = tokenGenerate.getToken(userToken);
        if (userId == null) {
            setResultError(BaseResponseStruct.ResponseCode.NOT_SIGN_YET);
        }
        List<JSONObject> orderInfo = orderService.getOrderByUserId(Long.parseLong(userId));
        JSONObject responseData = new JSONObject();
        responseData.put("orderInfo", orderInfo);
        return setResultSuccess(responseData);
    }
}
