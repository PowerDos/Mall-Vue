package com.example.global.util.baseResponse;/**
 * @title: BaseRespon
 * @projectName MyProject
 * @description: TODO
 * @author Administrator
 * @date 2020/2/2517:45
 */

import lombok.Data;

/**
 * 描述
 *
 * @author WuHao
 * @version 1.0 2020/02/25
 */
@Data
public class BaseResponse<T> {

    private Integer rtnCode;
    private String msg;
    private T data;

    public BaseResponse() {

    }

    public BaseResponse(Integer rtnCode, String msg, T data) {
        this.rtnCode = rtnCode;
        this.msg = msg;
        this.data = data;
    }

}

