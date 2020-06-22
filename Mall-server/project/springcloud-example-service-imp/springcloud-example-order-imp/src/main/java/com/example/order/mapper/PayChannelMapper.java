package com.example.order.mapper;

import com.example.order.entities.PayChannelDO;
import org.apache.ibatis.annotations.Select;

public interface PayChannelMapper {

    @Select("select * from example_pay_channel where channel_bean = #{channelBean}")
    PayChannelDO getPayChannelByChannelBean(String channelBean);

    @Select("select * from example_pay_channel where channel_id = #{ChannelId}")
    PayChannelDO getPayChannelById(Long ChannelId);

}
