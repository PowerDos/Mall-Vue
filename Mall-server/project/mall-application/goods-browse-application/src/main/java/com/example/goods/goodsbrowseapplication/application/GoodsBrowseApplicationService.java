package com.example.goods.goodsbrowseapplication.application;

import com.example.goods.goodsbrowseapplication.application.dto.GoodsColumnDTO;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.service.GoodsColumnService;
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

    /**
     * 获取所有的商品栏目信息
     *
     * <p>在应用层中调用领域服务来获取所有的商品栏目信息，并且将其转换成DTO对象</p>
     *
     * @return 返回 {@code GoodsColumnDTO} 商品栏目的DTO对象
     * @see GoodsColumnDTO
     */
    public List<GoodsColumnDTO> browseAllColumns() {
        // 调用领域服务获取数据
        List<GoodsColumn> goodsColumnList = goodsColumnService.browseAllColumns();

        // DO转DTO
        return GoodsColumnDTO.convertFromDO(goodsColumnList);
    }
}
