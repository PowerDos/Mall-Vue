package com.example.goods.goodsbrowseapplication.domain.goodscolumn.service;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.repository.GoodsColumnRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品栏目领域服务
 *
 * <p>商品栏目领域服务，用于完成多聚合间的处理或者涉及到base层操作</p>
 *
 * @author WuHao
 * @since 2021/2/27 15:48
 */
@Service
public class GoodsColumnService {

    @Autowired
    private GoodsColumnRepository goodsColumnRepository;

    /**
     * 获取所有的商品栏目信息
     *
     * <p>完成商品栏目仓储的创建，并执行商品栏目聚合的浏览商品栏目行为</p>
     *
     * @return List<GoodsColumn>
     */
    public List<GoodsColumn> browseColumns() {
        // 仓储创建过程
        List<GoodsColumn> goodsColumnList = goodsColumnRepository.findAllWhichEnable();

        // 调用聚合的行为
        for (GoodsColumn goodsColumn : goodsColumnList) {
            goodsColumn.browseColumn();
        }
        return goodsColumnList;
    }

}
