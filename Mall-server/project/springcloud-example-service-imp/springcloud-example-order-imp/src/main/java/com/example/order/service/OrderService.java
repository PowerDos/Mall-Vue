package com.example.order.service;

import com.alibaba.fastjson.JSONObject;
import com.example.order.entities.PayChannelDO;
import com.example.entitity.DO.OrderDO;
import com.example.entitity.DO.OrderDetailDO;
import com.example.entitity.DO.PayTransactionDO;
import com.example.entitity.DTO.PayInfoDTOInput;
import com.example.order.feign.goods.GoodServiceFeign;
import com.example.order.mapper.OrderDetailMapper;
import com.example.order.mapper.PayChannelMapper;
import com.example.order.mapper.OrderMapper;
import com.example.order.mapper.PayTransactionMapper;
import com.example.global.util.baseResponse.BaseResponse;
import com.example.global.util.snowFlake.SnowFlakeIdUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class OrderService {

    @Autowired
    private OrderDetailMapper orderDetailMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private PayChannelMapper payChannelMapper;
    @Autowired
    private PayTransactionMapper payTransactionMapper;
    @Autowired
    private GoodServiceFeign goodServiceFeign;

    public PayTransactionDO generatePayTransaction(PayInfoDTOInput payInfo, String userId) throws Exception {

        // TODO 暂时支付方式仅支持支付宝
        payInfo.setPayChannelBean("aliPayTest");

        // 1.解析payInfo中的商品信息并插入订单信息到example_order_detail表
        List<OrderDetailDO> payList = payInfo.getPayList();
        List<Map<String, Long>> bugInfos = new ArrayList<>();
        for (OrderDetailDO orderDetailDO : payList) {
            orderDetailDO.setPrice(orderDetailDO.getPrice() * 100L);
            Map<String, Long> bugInfo = new HashMap<>();
            bugInfo.put("specsId", orderDetailDO.getSpecsId());
            bugInfo.put("count", orderDetailDO.getCount());
            bugInfos.add(bugInfo);
        }
        // 修改example_product_specs库存
        String transformData = JSONObject.toJSONString(bugInfos);
        BaseResponse<JSONObject> handleStorage = goodServiceFeign.handleGoodStorage(transformData);
        String result = handleStorage.getMsg();
        if (!result.equals("success")) {
            // 删除库存失败！
            throw new Exception("调用减少商品库存接口时失败！");
        }

        int result0 = orderDetailMapper.insertOrderDetail(payList);
        if (result0 <= 0) {
            throw new Exception("sql插入异常");
        }
        // 2.插入订单信息example_order表
        OrderDO orderDO = new OrderDO();
        // user_id
        orderDO.setUserId(Long.parseLong(userId));
        // order_detail_id_list + total_price
        List<Long> orderDetailIdList = new ArrayList<>();
        Long totalPrice = 0L;
        for (OrderDetailDO orderDetailDO : payList) {
            orderDetailIdList.add(orderDetailDO.getOrderDetailId());
            totalPrice += orderDetailDO.getPrice() * orderDetailDO.getCount();
        }
        String orderDetailIdListStr = StringUtils.join(orderDetailIdList.toArray(), ",");
        orderDO.setOrderDetailIdList(orderDetailIdListStr);
        orderDO.setTotalPrice(totalPrice);
        // vision
        orderDO.setVision(1L);
        //created_by
        orderDO.setCreatedBy("admin");
        //create_time
        orderDO.setCreatedTime(new Date());
        int result1 = orderMapper.insertOrder(orderDO);
        if (result1 <= 0) {
            throw new Exception("sql插入异常");
        }

        // 3.插入交易记录example_order_transaction表
        PayTransactionDO payTransactionDO = new PayTransactionDO();
        // transactionId
        String transactionId = SnowFlakeIdUtil.nextId();// 雪花算法生成订单支付id
        payTransactionDO.setTransactionId(Long.parseLong(transactionId));
        // payAmount实付金额 TODO 优惠券功能
        List<Integer> couponIdList = payInfo.getCouponIdList();
        payTransactionDO.setPayAmount(totalPrice);
        // payStatue订单状态 1：待支付
        payTransactionDO.setPayStatue(1);
        // userId
        payTransactionDO.setUserId(Long.parseLong(userId));
        // orderId
        payTransactionDO.setOrderId(orderDO.getOrderId());
        // 其他参数
        String payChannelBean = payInfo.getPayChannelBean();
        PayChannelDO selectPayChannel = payChannelMapper.getPayChannelByChannelBean(payChannelBean);
        payTransactionDO.setChannelId(selectPayChannel.getChannelId());
        payTransactionDO.setVersion(1L);
        payTransactionDO.setCreatedBy("admin");
        payTransactionDO.setCreatedTime(new Date());
        return payTransactionDO;
    }

    //    [{
//        order_id: 1529931938150,
//                count: 1,
//        package: '无',
//                price: 28,
//                title: '苹果旗舰店',
//                createAt: '2018-06-06 20:06:08'
//    }]
    public List<JSONObject> getOrderByUserId(Long userId) {
        List<JSONObject> orderInfo = new ArrayList<>();
        List<OrderDO> pieceOrderInfos = orderMapper.getOrderInfoByUserId(userId);
        for (OrderDO pieceOrderInfo : pieceOrderInfos) {
            JSONObject pieceOrder = new JSONObject();
            // order_id
            pieceOrder.put("order_id", pieceOrderInfo.getOrderId());
            // count
            int totalCount = 0;
            String orderDetailIdList = pieceOrderInfo.getOrderDetailIdList();
            String[] orderDetailIds = orderDetailIdList.split(",");
            for (String orderDetailIdStr : orderDetailIds) {
                OrderDetailDO orderDetail = orderDetailMapper.getOrderDetailByOrderDetailId(Long.parseLong(orderDetailIdStr));
                totalCount += orderDetail.getCount();
            }
            pieceOrder.put("count", totalCount);
            // package
            pieceOrder.put("package", "无");
            // price
            pieceOrder.put("price", pieceOrderInfo.getTotalPrice());
            // title
            pieceOrder.put("title", "苹果旗舰店");
            // createAt
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            pieceOrder.put("createAt", df.format(pieceOrderInfo.getCreatedTime()));
            orderInfo.add(pieceOrder);
            // orderStatue
            PayTransactionDO payTransaction = payTransactionMapper.getPayTransactionByOrderId(pieceOrderInfo.getOrderId());
            int payStatue = payTransaction.getPayStatue();
            //  0：交易成功 1：待付款  2：取消支付 3：交易失败 4：待验证是否成功
            String orderStatue = "";
            switch (payStatue) {
                case 0:
                    orderStatue = "支付成功";
                    break;
                case 1:
                    orderStatue = "待支付";
                    break;
                case 2:
                    orderStatue = "订单取消";
                    break;
                case 3:
                    orderStatue = "支付失败";
                case 4:
                    orderStatue = "正在查询支付结果";
                    break;
                default:
                    break;
            }
            pieceOrder.put("orderStatue", orderStatue);
            orderInfo.add(pieceOrder);
        }
        return orderInfo;

    }
}
