package com.example.seckill.mapper;

import com.example.entitity.DO.SeckillGoodDO;
import org.apache.ibatis.annotations.Select;

public interface SeckillGoodMapper {

    @Select("select * from example_seckill_good where seckill_good_id = #{seckillGoodId}")
    SeckillGoodDO getSeckillGoodDo(Long seckillGoodId);
}
