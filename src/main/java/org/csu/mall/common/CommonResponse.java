package org.csu.mall.common;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;

import java.io.Serializable;

@Getter
//非空的数据才会被序列化成json
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CommonResponse<T> implements Serializable {

    private int status;
    private String msg;
    private T data;

    public CommonResponse(int status) {
        this.status = status;
    }

    public CommonResponse(int status, String msg) {
        this.status = status;
        this.msg = msg;
    }

    public CommonResponse(int status, String msg, T data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public CommonResponse(int status, T data) {
        this.status = status;
        this.data = data;
    }

    @JsonIgnore
    public boolean isSuccess(){
        return this.status == ResponseCode.SUCCESS.getCode();
    }

    public static <T> CommonResponse<T> createForSuccess() {
        return new CommonResponse<T>(ResponseCode.SUCCESS.getCode());
    }

    public static <T> CommonResponse<T> createForSuccess(T data) {
        return new CommonResponse<T>(ResponseCode.SUCCESS.getCode(), data);
    }

    public static <T> CommonResponse<T> createForSuccessMessage(String msg) {
        return new CommonResponse<T>(ResponseCode.SUCCESS.getCode(), msg);
    }

    public static <T> CommonResponse<T> createForSuccess(String msg, T data) {
        return new CommonResponse<T>(ResponseCode.SUCCESS.getCode(), msg, data);
    }

    public static <T> CommonResponse<T> createForError(){
        return new CommonResponse<T>(ResponseCode.ERROR.getCode(), ResponseCode.ERROR.getDescription());
    }
    public static <T> CommonResponse<T> createForError(String msg){
        return new CommonResponse<T>(ResponseCode.ERROR.getCode(), msg);
    }
    public static <T> CommonResponse<T> createForError(int code, String msg){
        return new CommonResponse<>(code, msg);
    }

    public static <T> CommonResponse<T> createForNeedLogin(String msg){
        return new CommonResponse<T>(ResponseCode.NEED_LOGIN.getCode(), msg);
    }
}
