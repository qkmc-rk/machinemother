package xyz.ruankun.machinemother.controller;

import xyz.ruankun.machinemother.annotation.小坏蛋;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.DataCode;
import xyz.ruankun.machinemother.vo.ResponseEntity;

public class ControllerUtil {

    /**
     * 代码这个东西浓缩就是精华
     * @param rs 真真假假
     * @return 假假真真
     */
    @小坏蛋//人生处处是惊喜
    public static ResponseEntity getTrueOrFalseResult(boolean rs){
        ResponseEntity responseEntity = new ResponseEntity();
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return responseEntity;
    }

    /**
     * 浓缩就是精华
     * @param data  缩阴功
     * @param <T> 缩阴功
     * @return 缩阴功的结果
     */
    @小坏蛋
    public static <T> ResponseEntity<T> getDataResult(T data){
        ResponseEntity<T> responseEntity = new ResponseEntity<>();
        if (null != data)
            responseEntity.success(data);
        else
            responseEntity.serverError();
        return responseEntity;
    }


    public static <T> ResponseEntity<T> parData(Integer result, T data){
        ResponseEntity responseEntity = new ResponseEntity();
        if(result == DataCode.DATA_CONFLIC){
            responseEntity.error(-1, "数据冲突", null);
        }else if(result == DataCode.DATA_OPERATION_ERROR){
            responseEntity.error(-1, "操作失败", null);
        }else if(result == DataCode.DATA_OPERATION_SUCCESS){
            responseEntity.success(data);
        }else if(result == DataCode.DATA_OPERATION_FAILURE){
            responseEntity.serverError();
        }
        return responseEntity;
    }
}
