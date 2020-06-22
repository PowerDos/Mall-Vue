package com.example.remarks.api;

import com.alibaba.fastjson.JSONObject;
import com.example.api.RemarksService;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RemarksServiceImp extends BaseApiService<JSONObject> implements RemarksService {

    @Autowired
    private com.example.remarks.service.RemarksService remarksService;

    @Override
    public BaseResponse<JSONObject> getRemarksInfo(Long remarksId) {
        JSONObject responseData = new JSONObject();
        responseData.put("remarksInfo", remarksService.getRemarksInfo(remarksId));
        return setResultSuccess(responseData);
    }
}
