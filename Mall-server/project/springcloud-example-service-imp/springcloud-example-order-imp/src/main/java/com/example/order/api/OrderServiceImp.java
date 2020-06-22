package com.example.order.api;

import com.alibaba.fastjson.JSONObject;
import com.example.api.OrderService;
import com.example.entitity.DO.PayTransactionDO;
import com.example.entitity.DTO.PayInfoDTOInput;
import com.example.order.mapper.PayTransactionMapper;
import com.example.global.util.Transaction.Redis_DataBaseTransaction;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import com.example.global.util.constants.Constants;
import com.example.global.util.tokenGenerate.TokenGenerate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.TransactionStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class OrderServiceImp extends BaseApiService<JSONObject> implements OrderService {

    @Autowired
    private PayTransactionMapper payTransactionMapper;
    @Autowired
    private Redis_DataBaseTransaction transaction;
    @Autowired
    private TokenGenerate tokenGenerate;
    @Autowired
    private com.example.order.service.OrderService orderService;

    @Override
    public BaseResponse<JSONObject> prePay(PayInfoDTOInput payList, HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if(cookies==null){
            return setResultError("当前用户未登录！");
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("token")) {
                String userId = tokenGenerate.getToken(cookie.getValue());
                // 开启redis和mysql事务
                TransactionStatus transactionStatus = transaction.begin();
                try {
                    PayTransactionDO payTransactionDO = orderService.generatePayTransaction(payList, userId);
                    // 在数据库中插入预支付订单信息
                    int result = payTransactionMapper.insertPayTransaction(payTransactionDO);
                    if (result < 0) {
                        transaction.rollback(transactionStatus);
                        setResultError("系统错误!");
                    }
                    // 生成的预支付订单信息的主键id
                    String id = payTransactionDO.getId().toString();
                    System.out.println("生成的预支付订单信息的主键id" + id);
                    // 在redis中存放订单支付id并返回token
                    String payToken = tokenGenerate.createToken(Constants.PAY_TRANSACTION_KEY, id, Constants.PAY_TRANSACTION_TIMEOUT);
                    transaction.commit(transactionStatus);
                    JSONObject resultData = new JSONObject();
                    resultData.put("payToken", payToken);
                    return setResultSuccess(resultData);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    try {
                        transaction.rollback(transactionStatus);
                        return setResultError("系统错误！");
                    } catch (Exception ex) {
                        return setResultError("系统错误！");
                    }
                }
            }
        }
        return setResultError("当前未登录！");
    }


    @Override
    public BaseResponse<JSONObject> loadOrders(String userToken) {
        // 1.验证用户登录状态toke
        String userId = tokenGenerate.getToken(userToken);
        if(userId==null){
            setResultError("当前用户未登录");
        }
        List<JSONObject> orderInfo = orderService.getOrderByUserId(Long.parseLong(userId));
        JSONObject responseData = new JSONObject();
        responseData.put("orderInfo",orderInfo);
        return setResultSuccess(responseData);
    }
}
