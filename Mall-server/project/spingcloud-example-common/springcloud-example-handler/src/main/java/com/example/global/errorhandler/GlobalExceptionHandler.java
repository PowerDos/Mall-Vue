package com.example.global.errorhandler;

import com.alibaba.fastjson.JSONObject;
import com.example.global.util.baseResponse.BaseApiService;
import com.example.global.util.baseResponse.BaseResponseStruct;
import jdk.nashorn.internal.runtime.regexp.joni.exception.InternalException;
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

  @ExceptionHandler(InternalException.class)
  @ResponseBody
  public BaseResponseStruct<JSONObject> runtimeExceptionHandler(Exception e) {
    e.printStackTrace();
    return setResultError("系统错误!");
  }

  @ExceptionHandler(IllegalArgumentException.class)
  @ResponseBody
  public BaseResponseStruct<JSONObject> illegalArgumentExceptionHandler(Exception e) {
    e.printStackTrace();
    return setResultError("入参错误" + e.getMessage());
  }

  @ExceptionHandler(Exception.class)
  @ResponseBody
  public BaseResponseStruct<JSONObject> exceptionHandler(Exception e) {
    e.printStackTrace();
    return setResultError("未知错误!");
  }
}

