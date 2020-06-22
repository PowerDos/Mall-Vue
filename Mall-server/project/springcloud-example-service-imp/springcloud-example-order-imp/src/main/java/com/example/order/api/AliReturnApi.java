package com.example.order.api;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.example.order.entities.PayChannelDO;
import com.example.order.mapper.PayChannelMapper;
import com.example.order.mapper.PayTransactionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
public class AliReturnApi {

    @Autowired
    private PayChannelMapper payChannelMapper;
    @Autowired
    private PayTransactionMapper payTransactionMapper;

    @PostMapping("/getPayNotify")
    public String getPayNotify(HttpServletRequest request) {
        PayChannelDO alipay_testChannelInfo = payChannelMapper.getPayChannelByChannelBean("aliPayTest");
        String platformPublicKey = alipay_testChannelInfo.getPlatformPublicKey();
        Map<String, String[]> parameterMap = request.getParameterMap();
        Map<String, String> rowParam = new HashMap<>();
        for (Map.Entry<String, String[]> param : parameterMap.entrySet()) {
            rowParam.put(param.getKey(), param.getValue()[0]);
        }
        try {
            boolean check = AlipaySignature.rsaCheckV1(rowParam, platformPublicKey, "UTF-8", "RSA2");
            if (check) {

                System.out.println(rowParam);
                // TODO提交到MQ确保消息幂等性
                String tradeNo = rowParam.get("trade_no");
                String outTradeNo = rowParam.get("out_trade_no");
                int result = payTransactionMapper.UpdateThirdPartTransactionId(tradeNo, outTradeNo);
                if (result <= 0) {
                    System.out.println("订单号" + rowParam.get("trade_no") + "状态异常");
                }
            }
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        return "success";
    }
}
