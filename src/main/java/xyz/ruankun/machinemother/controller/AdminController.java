package xyz.ruankun.machinemother.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import xyz.ruankun.machinemother.service.AdminService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

/**
 * 这个controller主要处理与管理员本身相关的请求
 * 比如管理员登录，其他的emmm好像没了
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService adminService;

    @Autowired
    UserInfoService userInfoService;

    @GetMapping("/token")
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
