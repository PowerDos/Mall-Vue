package com.example.order.api;

import com.alibaba.fastjson.JSONObject;
import com.example.api.PayService;
import com.example.order.entities.PayChannelDO;
import com.example.entitity.DO.PayTransactionDO;
import com.example.order.mapper.PayChannelMapper;
import com.example.order.mapper.PayTransactionMapper;
import com.example.order.payChannel.PayChannel;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import com.example.global.util.tokenGenerate.TokenGenerate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
public class PayServiceImp extends BaseApiService<JSONObject> implements PayService {

    @Autowired
    private TokenGenerate tokenGenerate;
    @Autowired
    private PayTransactionMapper payTransactionMapper;
    @Autowired
    private ApplicationContext context;
    @Autowired
    private PayChannelMapper payChannelMapper;

    @Override
    public BaseResponse<JSONObject> pay(String payToken, HttpServletResponse response) {

        String payTransactionIdStr = tokenGenerate.getToken(payToken);
        PayTransactionDO payTransactionDO = payTransactionMapper.getPayTransactionById(Long.parseLong(payTransactionIdStr));
        // TODO策略模式选择采用何种支付方式
        Long payChannelId = payTransactionDO.getChannelId();
        PayChannelDO payChannel = payChannelMapper.getPayChannelById(payChannelId);
        PayChannel channel = context.getBean(payChannel.getChannelBean(), PayChannel.class);
        channel.pay(payTransactionDO, response);
        return null;
    }

    @Override
    public BaseResponse<JSONObject> queryPayStatue(String body, String payToken) {

        JSONObject returnData = JSONObject.parseObject(body);
        Long out_trade_no = returnData.getLong("out_trade_no");
        // 1.验证同步回调的订单信息是否为预支付订单token的订单信息
        String payTransactionIdStr = tokenGenerate.getToken(payToken);
        PayTransactionDO payTransactionDO = payTransactionMapper.getPayTransactionById(Long.parseLong(payTransactionIdStr));
        Long prePayTokenTransactionId = payTransactionDO.getTransactionId();
        if (!prePayTokenTransactionId.equals(out_trade_no)) {
            // 回调的订单信息数据被篡改
            return setResultError("未知错误");
        }
        Float amountFloat = returnData.getFloat("total_amount") * 100;
        Long amount = amountFloat.longValue();
        String tradeNo = returnData.getString("trade_no");
        int result = payTransactionMapper.paySuccess(out_trade_no, amount, tradeNo);
        if (result > 0) {
            return setResultSuccess("success");
        }
        return setResultSuccess("wait");

    }
}
