package com.example.goods.goodsbrowseapplication.base.repository.goodscolumn;

import com.example.goods.goodsbrowseapplication.base.repository.goodscolumn.po.*;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface GoodsColumnMapper {

    @Select("select column_id from goods_column")
    @Results({
            @Result(one = @One(select = "selectColumnPOByColumnId", fetchType = FetchType.LAZY), column = "column_id",
                    property = "column"),
            @Result(one = @One(select = "selectGoodsInfoInColumnPOByColumnId", fetchType = FetchType.LAZY), column = "column_id",
                    property = "goodsInfo"),
            @Result(one = @One(select = "selectGoodsColumnHeatPOByColumnId", fetchType = FetchType.LAZY), column = "column_id",
                    property = "heat")
    })
    List<GoodsColumnPO> findAllWhichEnable();


    @Select("select * from goods_column where column_id = #{columnId}")
    ColumnPO selectColumnPOByColumnId(Integer columnId);

    @Select("select #{columnId} AS column_id")
    @Results({
            @Result(many = @Many(select = "selectGoodsInfoPOByColumnId", fetchType = FetchType.EAGER), column = "column_id",
                    property = "goodsInfoList", javaType = List.class)
    })
    GoodsInfoInColumnPO selectGoodsInfoInColumnPOByColumnId(Integer columnId);

    @Select("select * from goods_column_goods_info where column_id = #{columnId}")
    List<GoodsInfoPO> selectGoodsInfoPOByColumnId(Integer columnId);

    @Select("select * from goods_column_heat where column_id = #{columnId}")
    GoodsColumnHeatPO selectGoodsColumnHeatPOByColumnId(Integer columnId);


}
