package com.example.remarks.mapper;

import com.example.domin.DO.RemarkDetailDO;
import com.example.domin.DO.RemarksDO;
import com.example.domin.DO.RemarkTagDO;
import com.example.global.util.cache.EnableCache;
import org.apache.ibatis.annotations.Select;

public interface RemarksMapper {

    @EnableCache
    @Select("SELECT * FROM `example_remarks` WHERE `remarks_id` = #{remarksId}")
    RemarksDO getRemarksById(Long remarksId);

    @EnableCache
    @Select("SELECT * FROM `example_remark_tag` WHERE `remark_tag_id` = #{remarkTagId}")
    RemarkTagDO getRemarksTagById(Long remarkTagId);

    @EnableCache
    @Select("SELECT * FROM `example_remark_detail` WHERE `remark_detail_id` = #{remarkDetailId}")
    RemarkDetailDO getRemarksDetailById(Long remarkDetailId);
}
