package com.example.order.payChannel;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.example.order.entities.PayChannelDO;
import com.example.entitity.DO.PayTransactionDO;
import com.example.order.mapper.PayChannelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.text.DecimalFormat;

@Component
public class AliPayTest implements PayChannel {
    @Autowired
    private PayChannelMapper payChannelMapper;

    private static AlipayClient alipayClient;


    private synchronized void initial() {
        PayChannelDO alipay_testChannelInfo = payChannelMapper.getPayChannelByChannelBean("aliPayTest");
        String URL = "https://openapi.alipaydev.com/gateway.do";
        String APP_ID = alipay_testChannelInfo.getAppId().toString();
        String APP_PRIVATE_KEY = alipay_testChannelInfo.getPrivateKey();
        String FORMAT = "json";
        String CHARSET = "UTF-8";
        String ALIPAY_PUBLIC_KEY = alipay_testChannelInfo.getPlatformPublicKey();
        String SIGN_TYPE = "RSA2";
        alipayClient = new DefaultAlipayClient(URL, APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE);
    }


    @Override
    public void pay(PayTransactionDO payTransactionDO, HttpServletResponse response) {
        if (alipayClient == null) {
            initial();
        }
        Long payAmount = payTransactionDO.getPayAmount()/100L;
        Long transactionId = payTransactionDO.getTransactionId();
        try {
            String subject = "订单" + transactionId;
            String outTradeNo = transactionId.toString();
            JSONObject bizContent = new JSONObject();
            bizContent.put("out_trade_no", outTradeNo);
            DecimalFormat df = new DecimalFormat("#.00");
            String totalAmount = df.format(payAmount.longValue());
            System.out.println(totalAmount);
            bizContent.put("product_code", "FAST_INSTANT_TRADE_PAY");
            bizContent.put("total_amount", totalAmount);
            bizContent.put("subject", subject);
            bizContent.put("body", "订单描述");
//            bizContent.put("passback_params", "1");//支付宝异步通知的回传参数
            AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest(); //创建API对应的request
            alipayRequest.setReturnUrl("http://2163749p0s.iask.in:57681/#/paydone");
            alipayRequest.setNotifyUrl("http://2163749p0s.iask.in:38707/api-order/getPayNotify"); //在公共参数中设置回跳和通知地址
            String bizContentStr = bizContent.toJSONString();
            alipayRequest.setBizContent(bizContentStr); //填充业务参数
            String form = "";
            try {
                form = alipayClient.pageExecute(alipayRequest).getBody();  //调用SDK生成表单
            } catch (AlipayApiException e) {
                e.printStackTrace();
            }
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().write(form); //直接将完整的表单html输出到页面
            response.getWriter().flush();
            response.getWriter().close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
