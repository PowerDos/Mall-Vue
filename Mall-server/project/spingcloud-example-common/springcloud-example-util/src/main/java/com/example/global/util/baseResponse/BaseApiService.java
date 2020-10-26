package com.example.global.util.baseResponse;/**
 * @title: BaseApiService
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2517:44
 */

import com.example.global.util.constants.Constants;
import lombok.Data;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/25
 */
@Data
public class BaseApiService<T> {

    public BaseResponseStruct<T> setResultError(Integer code, String msg) {
        return setResult(code, msg, null);
    }

    // 返回错误，可以传msg
    public BaseResponseStruct<T> setResultError(String msg) {
        return setResult(Constants.HTTP_RES_CODE_500, msg, null);
    }

    // 返回成功，可以传data值
    public BaseResponseStruct<T> setResultSuccess(T data) {
        return setResult(Constants.HTTP_RES_CODE_200, Constants.HTTP_RES_CODE_200_VALUE, data);
    }

    // 返回成功，沒有data值
    public BaseResponseStruct<T> setResultSuccess() {
        return setResult(Constants.HTTP_RES_CODE_200, Constants.HTTP_RES_CODE_200_VALUE, null);
    }

    // 返回成功，沒有data值
    public BaseResponseStruct<T> setResultSuccess(String msg) {
        return setResult(Constants.HTTP_RES_CODE_200, msg, null);
    }

    // 通用封装
    public BaseResponseStruct<T> setResult(Integer code, String msg, T data) {
        return new BaseResponseStruct<T>(code, msg, data);
    }


}
