package xyz.ruankun.machinemother.service;

/**
 * 个人信息服务
 * 对应个人信息服务模块
 */
public interface UserInfoService {

    /**
     * 小程序的登录包含注册内容
     * 传入小程序的code，服务器从微信服务器拉取openid与session_key
     * 判断数据库中是否存在该openid,从而进行注册/登录成功，成功后生成token
     * 将token与userid存入redis<userid,token>，返回给用户token
     * @param code
     * @return
     */
    Integer login(String code);
}
