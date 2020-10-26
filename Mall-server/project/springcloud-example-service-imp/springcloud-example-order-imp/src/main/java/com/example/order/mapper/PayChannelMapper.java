package com.example.order.mapper;

import com.example.global.util.cache.EnableCache;
import com.example.order.entities.PayChannelDO;
import org.apache.ibatis.annotations.Select;

public interface PayChannelMapper {

    @EnableCache
    @Select("select * from example_pay_channel where channel_bean = #{channelBean}")
    PayChannelDO getPayChannelByChannelBean(String channelBean);

    @EnableCache
    @Select("select * from example_pay_channel where channel_id = #{ChannelId}")
    PayChannelDO getPayChannelById(Long ChannelId);

}
