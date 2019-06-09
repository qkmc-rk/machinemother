package xyz.ruankun.machinemother.util.code;

/**
 * user相关操作状态码
 */
public interface UserCode {

    Integer SUCCESS_OPERATION = 12;
    Integer ERROR_PARAMS = 13;
    Integer NO_EXIST = 14;
    Integer INVALID_OPERATION = 15;

    String NO_SUCH_USER = "用户不存在！!";
    String SUCCESS_MSG = "操作成功！";
    String INVALID_MSG = "非法操作！";
    String INVALID_DATA = "非法数据请求";

}
