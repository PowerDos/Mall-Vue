package com.example.goods.service;

import com.alibaba.fastjson.JSONObject;
import com.example.goods.entities.ESProductDO;
import com.example.entitity.DO.*;
import com.example.entitity.DTO.GoodDetailDTO;
import com.example.entitity.DTO.AttributeValueDTOOutput;
import com.example.entitity.DTO.CategoryDTOOutput;
import com.example.entitity.DTO.ProductDTOOutput;
import com.example.goods.feign.remark.RemarkFeign;
import com.example.goods.mapper.GoodsMapper;
import com.example.goods.repository.ProductsRep;
import com.example.goods.util.Util;
import com.example.global.util.baseResponse.BaseResponse;
import com.example.global.util.objectTransform.ObjectTransform;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private ProductsRep productsRep;
    @Autowired
    private RemarkFeign remarkFeign;

    /**
     * 获取所有商品的分类信息(1->2->3)
     *
     * @return example:
     * {
     * "categoriesInfo":[{
     * "detail": {
     * "navTags": [""],
     * "classNav": [
     * {
     * "title": "",
     * "tags": [""]
     * }]
     * },
     * "type": ""
     * }],
     * }
     */
    public List<JSONObject> getGoodsCategories() {
        List<JSONObject> categoriesInfos = new ArrayList<>();
        for (CategoryDO rootCategory : goodsMapper.getRootCategory()) {
            JSONObject categoriesInfo = new JSONObject();
            categoriesInfo.put("type", rootCategory.getName());
            JSONObject categoryDetail = new JSONObject();
            categoriesInfo.put("detail", categoryDetail);
            List<String> navTagsData = loadNavTagsData(rootCategory.getId());
            categoryDetail.put("navTags", navTagsData);
            List<JSONObject> classNavs = new ArrayList<>();
            for (CategoryDO secondCategory : goodsMapper.getCategoryByParentId(rootCategory.getId())) {
                JSONObject classNavData = new JSONObject();
                classNavData.put("title", secondCategory.getName());
                List<CategoryDTOOutput> tags = new ArrayList<>();
                classNavData.put("tags", tags);
                for (CategoryDO thirdCategory : goodsMapper.getCategoryByParentId(secondCategory.getId())) {
                    tags.add(ObjectTransform.doToDto(thirdCategory, CategoryDTOOutput.class));
                }
                classNavs.add(classNavData);
            }
            categoryDetail.put("classNav", classNavs);
            categoriesInfos.add(categoriesInfo);
        }
        return categoriesInfos;
    }

    /**
     * 获取对应一级分类的推荐标签
     *
     * @param categoryId 商品分类id(一级分类)
     * @return List<String>
     */
    public List<String> loadNavTagsData(Long categoryId) {
        String[] navTagsData = {};
        if (categoryId == 1L) {
            navTagsData = new String[]{"赛事1", "运动城"};
        } else if (categoryId == 5L) {
            navTagsData = new String[]{"赛事2", "运动城"};
        } else {
            navTagsData = new String[]{"赛事3", "运动城"};
        }
        return Arrays.asList(navTagsData);
    }

    /*
     *       tagsInfo: [
     *        {
     *          tagName: '品牌',
     *          tags: [ [Object:AttributeValueDTOOutput], [Object:AttributeValueDTOOutput] ]
     *        },
     *        {
     *          tagName: '手机配件',
     *          tags: [ [Object:AttributeValueDTOOutput], [Object:AttributeValueDTOOutput]]
     *        }
     *      ]
     */
    public List<JSONObject> getGoodsAttributes(Long categoryId) {
        List<JSONObject> tagsInfo = new ArrayList<>();
        List<AttributeKeyDO> attributeKeyDOs = goodsMapper.getAttributeKeyByCategoryId(categoryId);
        for (AttributeKeyDO attributeKeyDO : attributeKeyDOs) {
            JSONObject tagInfo = new JSONObject();
            tagInfo.put("tagName", attributeKeyDO.getAttributeName());
            List<AttributeValueDTOOutput> tags = new ArrayList<>();
            tagInfo.put("tags", tags);
            Long attributeKey = attributeKeyDO.getId();
            List<AttributeValueDO> attributeValueDOs = goodsMapper.getAttributeValueByAttributeId(attributeKey);
            for (AttributeValueDO attributeValueDO : attributeValueDOs) {
                tags.add(ObjectTransform.doToDto(attributeValueDO, AttributeValueDTOOutput.class));
            }
            tagsInfo.add(tagInfo);
        }
        return tagsInfo;
    }

    /**
     * {
     * asItems: [   // 广告信息
     * {
     * img: 'static/img/goodsList/item-as-img-1.jpg',
     * price: 39.9,
     * intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬',
     * num: 3140,
     * sale: 9000
     * }
     * ],
     * goodsList: [  // 商品信息
     * {
     * img: 'static/img/goodsList/item-show-1.jpg',
     * lowesPrice: 36.60,
     * intro: 'SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬壳男女磨砂防摔 火影红(苹',
     * comment: 6160,
     * shopName: '元亨利配件专营店',
     * sale: 9900
     * }
     * ]
     * }
     */
    public JSONObject getGoodsProducts(Long categoryId) {
        JSONObject products = new JSONObject();
        products.put("asItems", getAdItems());
        List<ProductDO> goodsLists = goodsMapper.getProductsByCategoryId(categoryId);
        List<ProductDTOOutput> goodsListsOutput = new ArrayList<>();
        for (ProductDO product : goodsLists) {
            ProductDTOOutput productDTOOutput = new ProductDTOOutput(product.getId(), product.getCategoryId(), product.getName(), product.getIntro(), product.getImg(), product.getAttributeIdList(), product.getLowestPrice(), product.getShopName(), product.getSale(), product.getComment());
            goodsListsOutput.add(productDTOOutput);
        }
        products.put("goodsList", goodsListsOutput);
        return products;
    }

    /**
     * 获取搜索结果下的所有商品信息
     *
     * @param searchStr 搜索字符串
     * @return 商品结果信息
     */
    public JSONObject searchGoodsProducts(String searchStr) {
        JSONObject products = new JSONObject();
        //广告商品
        products.put("asItems", getAdItems());
        List<ESProductDO> goodsLists = productsRep.findByNameOrIntro(searchStr, searchStr);
        List<ProductDTOOutput> goodsListsOutput = new ArrayList<>();
        for (ESProductDO product : goodsLists) {
            //这里使用BeanUtils.copyProperties转换dto对象有问题，需要手动转换
            ProductDTOOutput productDTOOutput = new ProductDTOOutput(product.getId(), product.getCategory_id(), product.getName(), product.getIntro(), product.getImg(), product.getAttribute_id_list(), product.getLowest_price(), product.getShop_name(), product.getSale(), product.getComment());
            goodsListsOutput.add(productDTOOutput);
        }
        //搜索结果
        products.put("goodsList", goodsListsOutput);
        return products;
    }

    /**
     * 获取广告商品信息
     *
     * @return 所有的广告商品
     */
    List<JSONObject> getAdItems() {
        List<JSONObject> asItems = new ArrayList<>();
        JSONObject asItem = new JSONObject();
        asItem.put("img", "static/img/goodsList/item-as-img-1.jpg");
        asItem.put("price", 3.98);
        asItem.put("intro", "SKSK 苹果7/7plus手机壳 iPhone 7 Plus保护套全包硬");
        asItem.put("num", "3140");
        asItem.put("sale", "9000");
        asItems.add(asItem);
        return asItems;
    }

    public GoodDetailDTO getGoodDetail(Long productId) {
        GoodDetailDTO goodDetailDTO = new GoodDetailDTO();
        // 从es中根据产品id查询到相应的产品信息
        Optional<ESProductDO> productDOOptional = productsRep.findById(productId);
        if (productDOOptional.isPresent()) {
            ESProductDO productDO = productDOOptional.get();
            // 设置goodDetailDTO的id
            goodDetailDTO.setProductId(productDO.getId());
            // 设置goodDetailDTO的title
            goodDetailDTO.setTitle(productDO.getName());
            // 设置goodDetailDTO的tags
            List<String> tags = new ArrayList<>();
            tags.add("满69-20元");
            tags.add("'关注产品★送钢化膜'");
            tags.add("'BIT配次日达'");
            goodDetailDTO.setTags(tags);
            // 设置goodDetailDTo的discount
            List<String> discount = new ArrayList<>();
            for (String discountIdStr : productDO.getDiscount_id_list().split(",")) {
                GoodDiscountDO goodDiscountDO = goodsMapper.geGoodDiscountByDiscountId(Long.parseLong(discountIdStr));
                discount.add(goodDiscountDO.getContent());
            }
            goodDetailDTO.setDiscount(discount);
            // 设置goodDetailDTo的promotion
            List<String> promotion = new ArrayList<>();
            for (String promotionIdStr : productDO.getPromotion_id_list().split(",")) {
                GoodPromotionDO goodPromotionDO = goodsMapper.getGoodPromotionByPromotionId(Long.parseLong(promotionIdStr));
                promotion.add(goodPromotionDO.getContent());
            }
            goodDetailDTO.setPromotion(promotion);
            // 设置goodDetailDTo的remarksNum
            goodDetailDTO.setRemarksNum(productDO.getComment());
            // 设置goodDetailDTo的setMeal , 图像goodImg
            List<String> goodImg = new ArrayList<>();
            List<List<JSONObject>> setMeal;
            List<JSONObject> meal = new ArrayList<>();
            // TODO 这里以后 JSONObject 可以改成具体对象
            for (String SpecsIdStr : productDO.getSpecs_id_list().split(",")) {
                GoodSpecsDO goodSpecsDO = goodsMapper.getGoodSpecsBySpecsId(Long.parseLong(SpecsIdStr));
                JSONObject mealInfo = new JSONObject();
                mealInfo.put("img", goodSpecsDO.getSmallImg());
                mealInfo.put("intro", goodSpecsDO.getIntro());
                mealInfo.put("price", goodSpecsDO.getPrice());
                mealInfo.put("specsId",SpecsIdStr);
                meal.add(mealInfo);
                goodImg.add(goodSpecsDO.getBigImg());
            }
            goodDetailDTO.setGoodsImg(goodImg);
            setMeal = Util.groupList(meal, 3);
            goodDetailDTO.setSetMeal(setMeal);
            // 设置goodDetailDTo的hot
            goodDetailDTO.setHot(getShopHotGood(productDO.getShop_id()));
            // 设置goodDetailDTo的goodsDetail
            String[] productDetailImgArr = productDO.getProduct_detail_img().split(",");
            List<String> goodsDetail = new ArrayList<>(Arrays.asList(productDetailImgArr));
            goodDetailDTO.setGoodsDetail(goodsDetail);
            // 设置goodDetailDTo的param
            List<JSONObject> param = new ArrayList<>();

            JSONObject paramData1 = new JSONObject();
            paramData1.put("title", "商品名称");
            paramData1.put("content", "电冰箱");

            JSONObject paramData2 = new JSONObject();
            paramData2.put("title", "商品编号");
            paramData2.put("content", productDO.getId());

            JSONObject paramData3 = new JSONObject();
            paramData3.put("title", "店铺");
            paramData3.put("content", productDO.getShop_name());

            JSONObject paramData4 = new JSONObject();
            paramData4.put("title", "商品产地");
            paramData4.put("content", "中国大陆");

            param.add(paramData1);
            param.add(paramData2);
            param.add(paramData3);
            param.add(paramData4);
            goodDetailDTO.setParam(param);
            // 设置goodDetailDTo的remarks
            goodDetailDTO.setRemarks(getGoodRemarks(productDO.getRemarks_id()));
            return goodDetailDTO;
        }
        return null;
    }

    public GoodDetailDTO getGoodDetailSeckill(Long productId, Long specsId) {
        GoodDetailDTO goodDetailDTO = new GoodDetailDTO();
        // 从es中根据产品id查询到相应的产品信息
        Optional<ESProductDO> productDOOptional = productsRep.findById(productId);
        if (productDOOptional.isPresent()) {
            ESProductDO productDO = productDOOptional.get();
            // 设置goodDetailDTO的id
            goodDetailDTO.setProductId(productDO.getId());
            // 设置goodDetailDTO的title
            goodDetailDTO.setTitle(productDO.getName());
            // 设置goodDetailDTO的tags
            List<String> tags = new ArrayList<>();
            tags.add("满69-20元");
            tags.add("'关注产品★送钢化膜'");
            tags.add("'BIT配次日达'");
            goodDetailDTO.setTags(tags);
            // 设置goodDetailDTo的discount
            List<String> discount = new ArrayList<>();
            for (String discountIdStr : productDO.getDiscount_id_list().split(",")) {
                GoodDiscountDO goodDiscountDO = goodsMapper.geGoodDiscountByDiscountId(Long.parseLong(discountIdStr));
                discount.add(goodDiscountDO.getContent());
            }
            goodDetailDTO.setDiscount(discount);
            // 设置goodDetailDTo的promotion
            List<String> promotion = new ArrayList<>();
            for (String promotionIdStr : productDO.getPromotion_id_list().split(",")) {
                GoodPromotionDO goodPromotionDO = goodsMapper.getGoodPromotionByPromotionId(Long.parseLong(promotionIdStr));
                promotion.add(goodPromotionDO.getContent());
            }
            goodDetailDTO.setPromotion(promotion);
            // 设置goodDetailDTo的remarksNum
            goodDetailDTO.setRemarksNum(productDO.getComment());
            // 设置goodDetailDTo的setMeal , 图像goodImg
            List<String> goodImg = new ArrayList<>();
            List<List<JSONObject>> setMeal;
            List<JSONObject> meal = new ArrayList<>();
            // TODO 这里以后 JSONObject 可以改成具体对象
//            for (String SpecsIdStr : productDO.getSpecs_id_list().split(",")) {
            GoodSpecsDO goodSpecsDO = goodsMapper.getGoodSpecsBySpecsId(specsId);
            JSONObject mealInfo = new JSONObject();
            mealInfo.put("img", goodSpecsDO.getSmallImg());
            mealInfo.put("intro", goodSpecsDO.getIntro());
            mealInfo.put("price", goodSpecsDO.getPrice());
            mealInfo.put("specsId",specsId);
            meal.add(mealInfo);
            goodImg.add(goodSpecsDO.getBigImg());
//            }
            goodDetailDTO.setGoodsImg(goodImg);
            setMeal = Util.groupList(meal, 3);
            goodDetailDTO.setSetMeal(setMeal);
            // 设置goodDetailDTo的hot
            goodDetailDTO.setHot(getShopHotGood(productDO.getShop_id()));
            // 设置goodDetailDTo的goodsDetail
            String[] productDetailImgArr = productDO.getProduct_detail_img().split(",");
            List<String> goodsDetail = new ArrayList<>(Arrays.asList(productDetailImgArr));
            goodDetailDTO.setGoodsDetail(goodsDetail);
            // 设置goodDetailDTo的param
            List<JSONObject> param = new ArrayList<>();

            JSONObject paramData1 = new JSONObject();
            paramData1.put("title", "商品名称");
            paramData1.put("content", productDO.getName());

            JSONObject paramData2 = new JSONObject();
            paramData2.put("title", "商品编号");
            paramData2.put("content", productDO.getId());

            JSONObject paramData3 = new JSONObject();
            paramData3.put("title", "店铺");
            paramData3.put("content", productDO.getShop_name());

            JSONObject paramData4 = new JSONObject();
            paramData4.put("title", "商品产地");
            paramData4.put("content", "中国大陆");

            param.add(paramData1);
            param.add(paramData2);
            param.add(paramData3);
            param.add(paramData4);
            goodDetailDTO.setParam(param);
            // 设置goodDetailDTo的remarks
            goodDetailDTO.setRemarks(getGoodRemarks(productDO.getRemarks_id()));
            return goodDetailDTO;
        }
        return null;
    }

    public List<JSONObject> getShopHotGood(Long shopId) {
        System.out.println("查询shopId=" + shopId + "的店铺的热销商品信息");
        // TODO 查询shopId店铺的热销商品
        List<JSONObject> hot = new ArrayList<>();

        JSONObject hotGood1 = new JSONObject();
        hotGood1.put("img", "static/img/goodsDetail/hot/1.jpg");
        hotGood1.put("price", 28.0);
        hotGood1.put("sale", 165076);

        JSONObject hotGood2 = new JSONObject();
        hotGood2.put("img", "static/img/goodsDetail/hot/2.jpg");
        hotGood2.put("price", 36.0);
        hotGood2.put("sale", 135078);

        JSONObject hotGood3 = new JSONObject();
        hotGood3.put("img", "static/img/goodsDetail/hot/3.jpg");
        hotGood3.put("price", 38.0);
        hotGood3.put("sale", 105073);

        JSONObject hotGood4 = new JSONObject();
        hotGood4.put("img", "static/img/goodsDetail/hot/4.jpg");
        hotGood4.put("price", 39.0);
        hotGood4.put("sale", 95079);

        JSONObject hotGood5 = new JSONObject();
        hotGood5.put("img", "static/img/goodsDetail/hot/5.jpg");
        hotGood5.put("price", 25.0);
        hotGood5.put("sale", 5077);

        JSONObject hotGood6 = new JSONObject();
        hotGood6.put("img", "static/img/goodsDetail/hot/6.jpg");
        hotGood6.put("price", 20.0);
        hotGood6.put("sale", 3077);

        hot.add(hotGood1);
        hot.add(hotGood2);
        hot.add(hotGood3);
        hot.add(hotGood4);
        hot.add(hotGood5);
        hot.add(hotGood6);
        return hot;
    }

    public JSONObject getGoodRemarks(String remarksId) {
        System.out.println("查询remarksId=" + remarksId + "的商品的评论信息");
        BaseResponse<JSONObject> remarksInfo = remarkFeign.getRemarksInfo(Long.parseLong(remarksId));
        JSONObject remarks = remarksInfo.getData();
        return remarks.getJSONObject("remarksInfo");
    }
}
