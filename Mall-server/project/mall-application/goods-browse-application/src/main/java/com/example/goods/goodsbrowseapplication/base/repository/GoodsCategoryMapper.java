package com.example.goods.goodsbrowseapplication.base.repository;

import com.example.goods.goodsbrowseapplication.domain.goodscategory.po.GoodsCategoryPO;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface GoodsCategoryMapper {
    @Select("SELECT" +
            " a.category_name AS root_category_name," +
            " a.category_id AS root_category_id," +
            " b.category_name AS sec_category_name," +
            " b.category_id AS sec_category_id," +
            " c.category_name AS third_category_name," +
            " c.category_id AS third_category_id " +
            "FROM" +
            " goods_category a" +
            " LEFT JOIN goods_category b ON a.category_id = b.parent_id" +
            " LEFT JOIN goods_category c ON b.category_id = c.parent_id " +
            "WHERE" +
            " a.parent_id = 0 " +
            " and c.category_id IS NOT NULL ")
    @Results({
            @Result(many = @Many(select = "findSpecsInfoByCategoryId", fetchType = FetchType.LAZY), column = "third_category_id",
                    property = "specsInfo", javaType = List.class),
            @Result(column = "third_category_id", property = "thirdCategoryId", id = true)
    })
    List<GoodsCategoryPO> findAll();

    @Select("select * from goods_category_specs_info where category_id = #{categoryId}")
    @Results({
            @Result(many = @Many(select = "findSpecsKeyBySpecsInfoId", fetchType = FetchType.LAZY), column = "specs_info_id",
                    property = "specsValue", javaType = List.class),
            @Result(column = "specs_info_id", property = "specsId", id = true)
    })
    List<GoodsCategoryPO.SpecsInfoPO> findSpecsInfoByCategoryId(Integer categoryId);


    @Select("select * from goods_category_specs_value where specs_info_id = #{specsInfoId}")
    List<GoodsCategoryPO.AvailableSpecsKeyPO> findSpecsKeyBySpecsInfoId(Integer specsInfoId);
}
