package com.example.goods.mapper;

import com.example.domin.DO.*;
import com.example.global.util.cache.EnableCache;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GoodsMapper {

    @EnableCache
    @Select("SELECT  id,name  FROM `example_category` WHERE `parent_id` = 0")
    List<CategoryDO> getRootCategory();

    @EnableCache
    @Select("SELECT id,name FROM `example_category` WHERE `parent_id` in #{parentIdList}")
    List<CategoryDO> getCategoryByParentIdIn(List<Long> parentIdList);

    @EnableCache
    @Select("SELECT id,name FROM `example_attribute_key` WHERE `category_id` = #{categoryId}")
    List<AttributeKeyDO> getAttributeKeyByCategoryId(Long categoryId);

    @EnableCache
    @Select("SELECT * FROM `example_attribute_value` WHERE `attribute_id` = #{attributeId}")
    List<AttributeValueDO> getAttributeValueByAttributeId(Long attributeId);

    @Select("SELECT * FROM `example_product` WHERE `category_id` = #{categoryId}")
    List<ProductDO> getProductsByCategoryId(Long categoryId);

    @EnableCache
    @Select("SELECT * FROM `example_product_discount` WHERE `discount_id` = #{discountId}")
    GoodDiscountDO geGoodDiscountByDiscountId(Long discountId);

    @EnableCache
    @Select("SELECT * FROM `example_product_promotion` WHERE `promotion_id` = #{promotionId}")
    GoodPromotionDO getGoodPromotionByPromotionId(Long promotionId);

    @EnableCache
    @Select("SELECT * FROM `example_product_specs` WHERE `specs_id` = #{specsId}")
    GoodSpecsDO getGoodSpecsBySpecsId(Long specsId);
}
