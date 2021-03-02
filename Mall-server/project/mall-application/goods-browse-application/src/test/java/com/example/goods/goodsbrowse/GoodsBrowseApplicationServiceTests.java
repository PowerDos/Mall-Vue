package com.example.goods.goodsbrowse;

import com.example.goods.goodsbrowseapplication.GoodsBrowseApplication;
import com.example.goods.goodsbrowseapplication.domain.goodscolumn.service.GoodsColumnService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

@SpringBootTest(classes = GoodsBrowseApplication.class)
class GoodsBrowseApplicationServiceTests {

    @Autowired
    private ApplicationContext context;

    @Test
    void browseColumn() {
        GoodsColumnService goodsColumnService = context.getBean(GoodsColumnService.class);
        goodsColumnService.browseAllColumns();
    }

}
