package com.example.goods.goodsbrowseapplication.base.repository.goodsspecs;

import com.example.goods.goodsbrowseapplication.base.repository.goodsspecs.po.GoodsSpecsPO;
import com.example.goods.goodsbrowseapplication.base.repository.goodsspecs.po.SpecsGoodsInfoPO;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface GoodsSpecsMapper {

    @Select("select #{categoryAndSpecsValuesCombineStr} AS category_and_specs_values_combine_str")
    @Results({
            @Result(column = "category_and_specs_values_combine_str",property = "categoryAndSpecsValuesCombineStr"),
            @Result(many = @Many(select = "selectGoodsIdByCategoryAndSpecsValuesCombineStr", fetchType = FetchType.EAGER), column = "category_and_specs_values_combine_str",
                    property = "goodsInfoList", javaType = List.class)
    })
    GoodsSpecsPO selectGoodsSpecsPOByCategoryAndSpecsValuesCombineStr(String categoryAndSpecsValuesCombineStr);

    @Select("SELECT " +
            " goods_id " +
            "FROM " +
            " `goods_category_and_specs_selector` " +
            "WHERE " +
            " category_and_specs_values_combine_str = #{categoryAndSpecsValuesCombineStr}")
    List<SpecsGoodsInfoPO> selectGoodsIdByCategoryAndSpecsValuesCombineStr(String categoryAndSpecsValuesCombineStr);
}
