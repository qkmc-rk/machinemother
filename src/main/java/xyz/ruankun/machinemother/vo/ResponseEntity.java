package xyz.ruankun.machinemother.vo;

import com.fasterxml.jackson.annotation.JsonProperty;
import xyz.ruankun.machinemother.util.Constant;

public class ResponseEntity<T> {

    @JsonProperty("code")
    private Integer code;
    @JsonProperty("msg")
    private String msg;
    @JsonProperty("data")
    private T data;


    public  void success(T data){
        this.code = Constant.SUCCESS_CODE;
        this.msg = Constant.MSG_SUCCESS;
        this.data = data;
    }

    public  void serverError(){
        this.code = Constant.FAILURE_CODE;
        this.msg = Constant.MSG_SERVER_ERROR;
    }

    public  void clientError(){
        this.code = Constant.FAILURE_CODE;
        this.msg = Constant.MSG_CLIENT_DATA_ERROR;
    }
}
