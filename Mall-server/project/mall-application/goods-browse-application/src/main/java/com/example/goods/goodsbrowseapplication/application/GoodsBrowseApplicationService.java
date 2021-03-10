package com.example.goods.goodsbrowseapplication.application;

import com.example.goods.goodsbrowseapplication.application.dto.GoodsCategoryDTO;
import com.example.goods.goodsbrowseapplication.application.dto.GoodsColumnDTO;
import com.example.goods.goodsbrowseapplication.application.dto.GoodsSpecsDTO;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.GoodsCategory;
import com.example.goods.goodsbrowseapplication.domain.goodscategory.service.GoodsCategoryService;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.po.GoodsColumnPO;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.service.GoodsColumnService;
import com.example.mallcommon.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品浏览应用服务
 *
 * <p>商品浏览应用服务，一般在其中调用领域服务，或者发送领域事件</p>
 * <p>注意：应用服务中不该包含逻辑的处理</p>
 * <p>application ——> domain.service</p>
 *
 * @author WuHao
 * @since 2021/2/27 17:22
 */
@Service
public class GoodsBrowseApplicationService {

    @Autowired
    private GoodsColumnService goodsColumnService;

    @Autowired
    private GoodsCategoryService goodsCategoryService;

    /**
     * 获取所有的商品栏目信息
     *
     * <p>在应用层中调用领域服务来获取所有的商品栏目信息，并且将其转换成DTO对象</p>
     *
     * @return 返回 {@code GoodsColumnDTO} 商品栏目的DTO对象
     * @see GoodsColumnDTO
     */
    @Query(DTOCls = GoodsColumnDTO.class, DOCls = GoodsColumn.class, POCls = GoodsColumnPO.class)
    public List<GoodsColumnDTO> browseColumns() {
        List<GoodsColumn> goodsColumnList = goodsColumnService.browseColumns();
        return GoodsColumnDTO.convertFromDO(goodsColumnList);
    }

    /**
     * 获取所有的商品类别信息
     *
     * @return List<GoodsCategoryDTO>
     * @see GoodsCategoryDTO
     */
    public List<GoodsCategoryDTO> getCategories() {
        List<GoodsCategory> categories = goodsCategoryService.getCategories();
        return GoodsCategoryDTO.convertFromDO(categories);
    }

    /**
     * 获取对应商品第三层级类别的商品规格信息
     *
     * @param thirdCategoryId 商品三级类别id
     * @return 商品规格信息
     */
    public List<GoodsSpecsDTO> getSpecsInfo(Integer thirdCategoryId) {
        List<GoodsCategory> categories = goodsCategoryService.getSpecsInfos(thirdCategoryId);
        return GoodsSpecsDTO.convertFromDO(categories);
    }


}
