package com.example.goods.goodsbrowseapplication.base.repository;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.po.GoodsColumnPO;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GoodsColumnMapper {

    @Select("select * from goods_column, goods_column_heat, goods_info_in_column " +
            "where goods_column.enable = 1 and " +
            "goods_column.goods_info_in_column_id = goods_info_in_column.goods_info_in_column_id and " +
            "goods_column.column_heat_id = goods_column_heat.column_heat_id ")
    List<GoodsColumnPO> findAllWhichEnable();

}
