package com.example.goods.goodsbrowseapplication.application;

import com.example.goods.goodsbrowseapplication.application.dto.GoodsColumnDTO;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;


@SpringBootTest
@RunWith(SpringRunner.class)
public class GoodsBrowseApplicationServiceTest {

    @Autowired
    private GoodsBrowseApplicationService goodsBrowseApplicationService;

    @Test
    public void browseAllColumns() throws Exception {
        List<GoodsColumnDTO> goodsColumnDTOS = goodsBrowseApplicationService.browseColumns();
        Assert.assertNotNull(goodsColumnDTOS);
    }
}