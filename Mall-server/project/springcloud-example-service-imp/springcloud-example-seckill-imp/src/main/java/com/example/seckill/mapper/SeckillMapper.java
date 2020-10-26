package com.example.seckill.mapper;

import com.example.entitity.DO.SeckillDO;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface SeckillMapper {
    @Select("SELECT * FROM `example_seckill` WHERE `start_time` = (SELECT MAX(`start_time`) FROM `example_seckill` WHERE `end_time` > NOW())")
    List<SeckillDO> getLastestSeckillInfo();

    @Select("SELECT * FROM `example_seckill` WHERE `seckill_id` = #{seckillId} AND `start_time` < NOW() AND `end_time` > NOW()")
    SeckillDO getSeckillDOById(Long seckillId);

    @Update("UPDATE " +
            "  `example_seckill` " +
            "SET " +
            "  `stock` = `stock` - 1, " +
            "  `vision` = `vision` + 1 " +
            "WHERE " +
            "  `seckill_id` = 1 " +
            "    AND `start_time` < NOW() " +
            "    AND `end_time` > NOW() " +
            "    AND `vision` = #{vision}")
    int seckillGood(Long seckillId,Integer vision);
}
