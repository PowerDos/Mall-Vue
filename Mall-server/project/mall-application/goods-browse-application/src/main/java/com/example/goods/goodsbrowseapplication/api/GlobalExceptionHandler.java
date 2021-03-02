package com.example.goods.goodsbrowseapplication.api;

import com.example.mallcommon.response.ErrorResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 全局异常处理
 *
 * @author WuHao
 * @since 2020-12-11 16:42
 **/
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    // 未定义的异常
    @ExceptionHandler(value = Exception.class)
    public ErrorResponse<Object> exceptionHandler(Exception e) {
        log.info("未定义的异常", e);
        return new ErrorResponse<>("A00001", "undefined exception", "程序错误");
    }
}
