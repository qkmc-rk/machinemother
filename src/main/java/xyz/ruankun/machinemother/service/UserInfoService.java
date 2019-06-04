package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.User;

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
     * @return 成功返回userId，其它情况返回错误代码
     */
    Integer login(String code);

    /**
     * 生成一个token，并把token和session_key一同存到redis中
     * @param session_key 从微信服务器拿到的session_key
     * @param token 系统随机生成的token
     * @param period 有效时间 分钟
     * @return 一切操作成功后的返回值
     */
    Boolean updateSession(Integer userId,String session_key, String token,Integer period);

    /**
     *一个从redis中根据key读取数据的方法
     *
     * @param key redis Key
     * @return redis中的Value
     */
    String readDataFromRedis(String key);
    void setDataToRedis(String key, String value, Integer min);

    /**
     * 注册一个用户，注册完成后跳到登录去
     * @param code
     * @param user
     * @return
     */
    Integer register(String code, User user);
}
