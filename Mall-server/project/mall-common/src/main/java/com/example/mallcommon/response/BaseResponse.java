package com.example.mallcommon.response;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * @author WuHao
 * @Description: 前后端交互报文格式
 * @since 2021/2/24 9:03
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@ApiModel
public class BaseResponse<T> {

    @ApiModelProperty(value = "请求的数据")
    private T data;

    public T getData() {
        return data;
    }

    public BaseResponse(T data) {
        this.data = data;
    }

}
