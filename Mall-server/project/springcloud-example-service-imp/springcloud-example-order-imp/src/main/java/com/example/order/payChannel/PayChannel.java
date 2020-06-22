package com.example.order.payChannel;

import com.example.entitity.DO.PayTransactionDO;

import javax.servlet.http.HttpServletResponse;

public interface PayChannel {
    void pay(PayTransactionDO payTransactionDO, HttpServletResponse response);
}
