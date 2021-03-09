package com.example.goods.goodsbrowseapplication.base.repository;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.po.GoodsColumnPO;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface GoodsColumnMapper {

    @Select("SELECT" +
            " * " +
            "FROM" +
            " goods_column AS c," +
            " goods_column_heat AS heat " +
            "WHERE" +
            " c.ENABLE = 1 " +
            " AND c.column_heat_id = heat.column_heat_id")
    @Results({
            @Result(many = @Many(select = "findByColumnId", fetchType = FetchType.LAZY), column = "column_id",
                    property = "goodsInfoList", javaType = List.class),
            @Result(column = "column_id", property = "columnId", id = true)
    })
    List<GoodsColumnPO> findAllWhichEnable();

    @Select("select * from goods_column_goods_info where column_id = #{columnId}")
    List<GoodsColumnPO.GoodsInfoInColumnPO> findByColumnId(Integer columnId);

}
