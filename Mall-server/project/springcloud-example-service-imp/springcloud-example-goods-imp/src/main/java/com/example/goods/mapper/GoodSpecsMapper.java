package com.example.goods.mapper;

import com.example.entitity.DO.GoodSpecsDO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface GoodSpecsMapper {

    @Update("update example_product_specs " +
            "set stock = stock - #{count}, " +
            "revision = revision + 1  " +
            "where stock >= #{count} and revision = #{vision} and specs_id = #{specsId}")
    int bugGood(@Param("specsId") Long specsId, @Param("count") Long count, @Param("vision") Long vision);


    @Select("select * from example_product_specs where specs_id = #{specsId}")
    GoodSpecsDO getGoodSpecsDO(Long specsId);
}
