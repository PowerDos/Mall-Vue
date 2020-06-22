package com.example.order.mapper;

import com.example.entitity.DO.PayTransactionDO;
import org.apache.ibatis.annotations.*;

public interface PayTransactionMapper {
    @Options(useGeneratedKeys = true)
    @Insert("insert into example_pay_transaction (transaction_id,pay_amount,pay_statue,user_id,order_id,channel_id,third_part_transaction_id,vision,created_by,created_time) values" +
            " (#{transactionId},#{payAmount},#{payStatue},#{userId},#{orderId},#{channelId},#{thirdPartTransactionId},'1',#{createdBy},#{createdTime})")
    int insertPayTransaction(PayTransactionDO payTransactionDO);

    @Select("select * from example_pay_transaction where id = #{id}")
    PayTransactionDO getPayTransactionById(Long id);

    @Select("select * from example_pay_transaction where order_id = #{orderId}")
    PayTransactionDO getPayTransactionByOrderId(Long orderId);

    @Update("update example_pay_transaction set third_part_transaction_id = #{thirdPartTransactionId},pay_statue = '4'" +
            " where transaction_id = #{transactionId}")
    int UpdateThirdPartTransactionId(@Param("thirdPartTransactionId") String thirdPartTransactionId, @Param("transactionId")String transactionId);

    @Update("update example_pay_transaction set pay_statue= '0' where transaction_id = #{out_trade_no} and pay_amount =" +
            " #{amount} and third_part_transaction_id = #{tradeNo}")
    int paySuccess(Long out_trade_no, Long amount, String tradeNo);
}
