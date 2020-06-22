package com.example.remarks.service;

import com.alibaba.fastjson.JSONObject;
import com.example.entitity.DO.RemarkDetailDO;
import com.example.entitity.DO.RemarkTagDO;
import com.example.entitity.DO.RemarksDO;
import com.example.remarks.mapper.RemarksMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RemarksService {

    @Autowired
    private RemarksMapper remarksMapper;

    public JSONObject getRemarksInfo(Long remarksId) {
        RemarksDO remarksDO = remarksMapper.getRemarksById(remarksId);

        System.out.println("查询remarksId=" + remarksId + "的商品的评论信息");
        JSONObject remarksInfo = new JSONObject();
        // goodAnalyse
        remarksInfo.put("goodAnalyse", remarksDO.getGoodAnalyse());
        // remarksTags
        List<String> remarksTags = new ArrayList<>();
        for (String remarksTagIdStr : remarksDO.getRemarksTagIdList().split(",")) {
            RemarkTagDO remarkTagDO = remarksMapper.getRemarksTagById(Long.parseLong(remarksTagIdStr));
            remarksTags.add(remarkTagDO.getContent());
        }
        remarksInfo.put("remarksTags", remarksTags);
        // remarksTags
        List<Integer> remarksNumDetail = new ArrayList<>();
        remarksNumDetail.add(remarksDO.getAddRemarksNum());
        remarksNumDetail.add(remarksDO.getGoodAnalyse());
        remarksNumDetail.add(remarksDO.getMidRemarksNum());
        remarksNumDetail.add(remarksDO.getBadRemarksNum());
        remarksInfo.put("remarksNumDetail", remarksNumDetail);
        // detail
        List<JSONObject> detail = new ArrayList<>();
        for (String remarksDetailIdStr : remarksDO.getRemarksDetailIdList().split(",")) {
            RemarkDetailDO remarkDetailDO = remarksMapper.getRemarksDetailById(Long.parseLong(remarksDetailIdStr));
            JSONObject pieceInfo = new JSONObject();
            pieceInfo.put("username", remarkDetailDO.getUsername());
            pieceInfo.put("values", remarkDetailDO.getValues());
            pieceInfo.put("content", remarkDetailDO.getContent());
            pieceInfo.put("goods", remarkDetailDO.getGoods());
            pieceInfo.put("create_at", remarkDetailDO.getCreateAt());
            detail.add(pieceInfo);
        }
        remarksInfo.put("detail", detail);
        return remarksInfo;
    }

}
