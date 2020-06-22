package com.example.global.errorhandler;

import com.alibaba.fastjson.JSONObject;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/03/05
 */
@ControllerAdvice
public class GlobalExceptionHandler extends BaseApiService<JSONObject> {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public BaseResponse<JSONObject> exceptionHandler(Exception e) {
        System.out.println("###全局捕获异常###,error:" + e);
        return setResultError("系统错误!");
    }
}

