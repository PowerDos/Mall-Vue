package com.example.goods.goodsbrowseapplication.base.repository;

import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.po.GoodsColumnPO;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.repository.GoodsColumnRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 商品栏目Repository实现类
 *
 * <p>商品栏目Repository实现类</p>
 *
 * @author WuHao
 * @since 2021/2/27 16:38
 */
@Repository
public class GoodsColumnRepositoryImpl implements GoodsColumnRepository {

    private ThreadLocal<GoodsColumnPO> originDataCache = new ThreadLocal<>();

    @Autowired
    private GoodsColumnMapper goodsColumnMapper;

    @Override
    public List<GoodsColumnPO> findAllWhichEnable() {
        List<GoodsColumnPO> allColumns = goodsColumnMapper.findAllWhichEnable();
        return allColumns;
    }
}
