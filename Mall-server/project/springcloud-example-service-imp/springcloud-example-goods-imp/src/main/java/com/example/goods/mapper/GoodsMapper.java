package com.example.goods.mapper;

import com.example.entitity.DO.*;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GoodsMapper {

    @Select("SELECT * FROM `example_category` WHERE `parent_id` = 0")
    List<CategoryDO> getRootCategory();

    @Select("SELECT * FROM `example_category` WHERE `parent_id` = #{parentId}")
    List<CategoryDO> getCategoryByParentId(Long parentId);

    @Select("SELECT * FROM `example_attribute_key` WHERE `category_id` = #{categoryId}")
    List<AttributeKeyDO> getAttributeKeyByCategoryId(Long categoryId);

    @Select("SELECT * FROM `example_attribute_value` WHERE `attribute_id` = #{attributeId}")
    List<AttributeValueDO> getAttributeValueByAttributeId(Long attributeId);

    @Select("SELECT * FROM `example_product` WHERE `category_id` = #{categoryId}")
    List<ProductDO> getProductsByCategoryId(Long categoryId);

    @Select("SELECT * FROM `example_product_discount` WHERE `discount_id` = #{discountId}")
    GoodDiscountDO geGoodDiscountByDiscountId(Long discountId);

    @Select("SELECT * FROM `example_product_promotion` WHERE `promotion_id` = #{promotionId}")
    GoodPromotionDO getGoodPromotionByPromotionId(Long promotionId);

    @Select("SELECT * FROM `example_product_specs` WHERE `specs_id` = #{specsId}")
    GoodSpecsDO getGoodSpecsBySpecsId(Long specsId);
}
