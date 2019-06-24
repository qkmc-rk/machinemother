package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.service.AdminService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

/**
 * 这个controller主要处理与管理员本身相关的请求
 * 比如管理员登录，其他的emmm好像没了
 */
@RestController
@RequestMapping("/admin")
@CrossOrigin
@Api(value = "仅仅与管理员相关的操作，比如登录下线刷新缓存等")
public class AdminController {

    @Autowired
    AdminService adminService;

    @Autowired
    UserInfoService userInfoService;

    //拦截判断是不是管理员
    @GetMapping("/token")
    @ApiOperation(value = "[管理员]管理员登录",notes = "说白了就是管理员获取token令牌，有效期15分钟，每次请求会刷新缓存时间")
    public ResponseEntity login(String account,String password){
        Integer rs = adminService.adminLogin(account,password);
        ResponseEntity responseEntity = new ResponseEntity();
        if(rs.equals(Constant.LOGIN_NO_USER)){
            //登录失败了，因为没有找到对应的用户
            responseEntity.error(Constant.LOGIN_NO_USER,"no such admin",null);
        }else {
            //登录成功了，送出token
            String token = userInfoService.readDataFromRedis(String.valueOf(rs.intValue()));
            responseEntity.success(Constant.LOGIN_SUCCESS,"login success",token);
        }
        return responseEntity;
    }


}
