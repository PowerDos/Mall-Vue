package com.example.order.mapper;

import com.example.entitity.DO.OrderDO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderMapper {

    @Options(useGeneratedKeys = true,keyProperty = "orderId")
    @Insert("insert into example_order(user_id,order_detail_id_list,total_price,vision,created_by,created_time) " +
            "values (#{userId},#{orderDetailIdList},#{totalPrice},'1',#{createdBy},#{createdTime})")
    int insertOrder(OrderDO orderDO);

    @Select("select * from example_order where user_id = #{userId}")
    List<OrderDO> getOrderInfoByUserId(Long userId);
}
