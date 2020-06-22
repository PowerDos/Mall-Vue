package com.example.order.mapper;

import com.example.entitity.DO.OrderDetailDO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderDetailMapper {

    /**
     * mybatis 批量插入脚本
     *
     * @param orderDetailDOList 要插入的orderDetail集合
     * @return 影响行数
     */
    @Options(useGeneratedKeys = true, keyProperty = "orderDetailId")
    @Insert("<script>" +
            "insert into example_order_detail(product_id, specs_id, count,price) values " +
            "<foreach collection='list' item='item' index='index' separator=','>" +
            "(#{item.productId}, #{item.specsId}, #{item.count}, #{item.price})" +
            "</foreach>" +
            "</script>")
    int insertOrderDetail(List<OrderDetailDO> orderDetailDOList);

    @Select("select * from example_order_detail where order_detail_id = #{orderDetailId}")
    OrderDetailDO getOrderDetailByOrderDetailId(Long orderDetailId);
}
