package com.example.seckill.service;

import com.alibaba.fastjson.JSONObject;
import com.example.seckill.mapper.SeckillGoodMapper;
import com.example.seckill.mapper.SeckillMapper;
import com.example.entitity.DO.SeckillDO;
import com.example.entitity.DO.SeckillGoodDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class SecKillService {

    @Autowired
    private SeckillMapper seckillMapper;
    @Autowired
    private SeckillGoodMapper seckillGoodMapper;

    /**
     * [{
     * intro: '【赠小风扇】维他 柠檬茶250ml*32盒 礼品装 整箱',
     * img: 'static/img/index/seckill/seckill-item1.jpg',
     * price: 71.9,
     * realPrice: 89.6
     * }]
     *
     * @return 当前时间的秒杀信息
     */
    public JSONObject getSecKillInfo() {
        JSONObject seckillInfo = new JSONObject();
        List<SeckillGoodDO> seckillGoods = new ArrayList<>();
        // seckillGoods 秒杀商品详情
        seckillInfo.put("seckillGoods", seckillGoods);
        // 默认秒杀已经开始
        seckillInfo.put("type", "began");
        // 1.查询下一次秒杀时间
        Date now = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String tempTime = df.format(now);
        List<SeckillDO> lastestSeckillInfo = seckillMapper.getLastestSeckillInfo();
        if (lastestSeckillInfo.size() == 0) {
            // 暂时没有秒杀
            JSONObject time = new JSONObject();
            time.put("hours", 0);
            time.put("minute", 0);
            time.put("seconds", 0);
            seckillInfo.put("time", time);
            return seckillInfo;
        }
        Date startTime = lastestSeckillInfo.get(0).getStartTime();
        // time 距离秒杀开始或结束时间
        JSONObject time = new JSONObject();
        time.put("hours", Math.abs(now.getHours() - startTime.getHours()));
        time.put("minute", Math.abs(now.getMinutes() - startTime.getMinutes()));
        time.put("seconds", Math.abs(now.getSeconds() - startTime.getSeconds()));
        seckillInfo.put("time", time);
        if (startTime.after(now)) {
            // 秒杀即将开始
            seckillInfo.put("type", "coming");
        }
        for (SeckillDO seckill : lastestSeckillInfo) {
            Long seckillGoodId = seckill.getSeckillGoodId();
            SeckillGoodDO seckillGoodDo = seckillGoodMapper.getSeckillGoodDo(seckillGoodId);
            seckillGoods.add(seckillGoodDo);
        }
        return seckillInfo;
    }
}
