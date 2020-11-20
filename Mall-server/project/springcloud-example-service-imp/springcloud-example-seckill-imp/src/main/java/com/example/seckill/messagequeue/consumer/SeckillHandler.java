package com.example.seckill.messagequeue.consumer;

import com.alibaba.fastjson.JSONObject;
import com.example.domin.DO.SeckillDO;
import com.example.seckill.config.RabbitMQConfig;
import com.example.seckill.mapper.SeckillMapper;
import com.example.global.util.constants.Constants;
import com.example.global.util.tokenGenerate.TokenGenerate;
import com.rabbitmq.client.Channel;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;

@Service
public class SeckillHandler {
    @Autowired
    private TokenGenerate tokenGenerate;
    @Autowired
    private SeckillMapper seckillMapper;

    @RabbitListener(queues = RabbitMQConfig.seckillQueue, ackMode = "MANUAL")
    @Transactional
    public void listener(String msg, Channel channel, Message message) throws IOException {
        System.out.println("listener1——来自*" + RabbitMQConfig.seckillQueue + "*的信息:" + msg);
        JSONObject secKillInfo = JSONObject.parseObject(msg);
        Long seckillId = secKillInfo.getLong("seckillId");
        String seckillToken = secKillInfo.getString("seckillToken");

        try {
            // 3.修改example_seckill表库存
            SeckillDO seckillDO = seckillMapper.getSeckillDOById(seckillId);
            Integer vision = seckillDO.getVision();
            int result1 = seckillMapper.seckillGood(seckillId, vision);
            if (result1 <= 0) {
                throw new Exception();
            }
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), true);
            tokenGenerate.updateToken(seckillToken, "success", Constants.SECKILL_TOKEN_TIMEOUT);
        } catch (Exception e) {
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), true);
            e.printStackTrace();
        }

    }
}
