package com.example.goods.goodsbrowseapplication.base.repository;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.po.GoodsColumnPO;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.repository.GoodsColumnRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author WuHao
 * @Description: 商品栏目Repository实现类
 * @since 2021/2/27 16:38
 */
@Repository
public class GoodsColumnRepositoryImpl implements GoodsColumnRepository {

    @Autowired
    private GoodsColumnMapper goodsColumnMapper;

    @Override
    public List<GoodsColumnPO> findAllWhichEnable() {
        List<GoodsColumnPO> allColumns = goodsColumnMapper.findAllWhichEnable();
        return allColumns;
    }
}
