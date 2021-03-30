package com.example.goods.goodsbrowseapplication.base.repository.goodscolumn;

import com.example.goods.goodsbrowseapplication.base.repository.goodscolumn.po.ColumnPO;
import com.example.goods.goodsbrowseapplication.base.repository.goodscolumn.po.GoodsColumnPO;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.GoodsColumn;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.repository.GoodsColumnRepository;
import com.example.mallcommon.lazyload.targetenhancer.TargetEnhancer;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
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

    @Autowired
    private ObjectFactory<TargetEnhancer> containerFactory;

    private ThreadLocal<ColumnPO> originDataCache = new ThreadLocal<>();

    @Autowired
    private GoodsColumnMapper goodsColumnMapper;

    @Override
    public List<GoodsColumn> findAllWhichEnable() {
        List<GoodsColumnPO> columnPOList = goodsColumnMapper.findAllWhichEnable();
        List<GoodsColumn> goodsColumnList = new ArrayList<>();
        for (GoodsColumnPO PO : columnPOList) {
            TargetEnhancer container = containerFactory.getObject();
            goodsColumnList.add(container.getTarget(PO, GoodsColumn.class));
        }
        return goodsColumnList;
    }
}
