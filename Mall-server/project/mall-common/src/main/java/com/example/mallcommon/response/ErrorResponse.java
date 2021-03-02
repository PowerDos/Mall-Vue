package com.example.mallcommon.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>处理失败的响应类</p>
 *
 * @author WuHao
 * @since 2021/3/2 11:13
 */
@ApiModel(value = "请求处理失败响应类", description = "请求处理失败，返回相关错误信息", parent = BaseResponse.class)
public class ErrorResponse<T> extends BaseResponse<T> {

    /**
     * 重写以忽略父类正确响应结果中的object(因为一定是null)
     */
    @Override
    @JsonIgnore
    public T getObject() {
        return super.getObject();
    }

    /**
     * 错误码
     */
    @ApiModelProperty(value = "错误码")
    private String errorCode;

    /**
     * 给前端人员或是调试人员的错误信息
     */
    @ApiModelProperty(value = "给前端人员或是调试人员的错误信息")
    private String errorMessage;

    /**
     * 给用户的错误提示信息
     */
    @ApiModelProperty(value = "给用户的错误提示信息")
    private String hintMessage;

    public ErrorResponse(String errorCode, String errorMessage, String hintMessage) {
        super(null);
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
        this.hintMessage = hintMessage;
    }

    public String getErrorCode() {
        return errorCode;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public String getHintMessage() {
        return hintMessage;
    }
}
