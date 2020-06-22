package com.example.goods.api;

import com.alibaba.fastjson.JSONObject;
import com.example.api.CategoryService;
import com.example.entitity.DO.CategoryDO;
import com.example.goods.mapper.GoodsMapper;
import com.example.goods.service.GoodsService;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class CategoryServiceImpl extends BaseApiService<JSONObject>  implements CategoryService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private GoodsService goodsService;

    @Override
    public BaseResponse<JSONObject> getGoodsRootCategory() {
        List<CategoryDO> rootCategory = goodsMapper.getRootCategory();
        List<String> categoryName = new ArrayList<>();
        for (CategoryDO categoryDO : rootCategory) {
            categoryName.add(categoryDO.getName());
        }
        JSONObject responseData = new JSONObject();
        responseData.put("rootCategoryNameList", categoryName);
        return setResultSuccess(responseData);
    }


    @Override
    public BaseResponse<JSONObject> getGoodsCategories() {
        JSONObject responseData = new JSONObject();
        responseData.put("categoriesInfo", goodsService.getGoodsCategories());
        return setResultSuccess(responseData);
    }

    @Override
    public BaseResponse<JSONObject> getGoodsAttributes(Long categoryId) {
        JSONObject responseData = new JSONObject();
        responseData.put("attributesInfo", goodsService.getGoodsAttributes(categoryId));
        return setResultSuccess(responseData);
    }
}
