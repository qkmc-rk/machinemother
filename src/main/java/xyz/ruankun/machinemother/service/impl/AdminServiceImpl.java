package xyz.ruankun.machinemother.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.Admin;
import xyz.ruankun.machinemother.repository.AdminRepository;
import xyz.ruankun.machinemother.service.AdminService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.MD5Util;

import java.util.Date;
import java.util.concurrent.TimeUnit;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    AdminRepository adminRepository;

    //可以用里面的方法操作redis
    @Autowired
    UserInfoService userInfoService;

    /**
     * 管理员登录方法，其实是管理员获取token的方法，与用户并无而已
     * 管理员的ID是单独设置的超长ID，与用户的普通ID铁定不一样。所以与用户信息混在一起也很好辨认
     * 管理员的token存储方法与普通用户的一致且在一起。
     * @param account 管理员登录账号
     * @param password 管理员登录密码，未加密的密码
     * @return 错误状态码或者管理员用户的id
     */
    @Override
    public Integer adminLogin(String account, String password) {
        Admin admin = null;
        //密码使用md5加密，默认盐machine mother
        admin = adminRepository.findByAccountAndPassword(account, MD5Util.md5(password));

        if(null == admin) return Constant.LOGIN_NO_USER;
        else{
            //登录成功
            String token = MD5Util.md5(new Date().toString());
            //设置session
            userInfoService.setDataToRedis(token,String.valueOf(admin.getId()),30);
            userInfoService.setDataToRedis(String.valueOf(admin.getId()),token,30);
            return admin.getId();

        }
    }

    @Override
    public Boolean updateSession(String userId, String token, Integer min) {
        //更新token
        setDataToRedis(userId,token,min);
        setDataToRedis(token,userId,min);
        return true;
    }

    public void setDataToRedis(String key, String value, Integer min) {
        ValueOperations<String, String> valueOperations = stringRedisTemplate.opsForValue();
        valueOperations.set(key,value,min, TimeUnit.MINUTES);
    }


}
