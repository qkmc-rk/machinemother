package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.vo.ResponseEntity;

@RestController
@CrossOrigin
@RequestMapping("/user")
@Api(value = "用户模块相关的操作由userController来实现")
public class UserInfoController {

    @Autowired
    UserInfoService userInfoService;

    @PostMapping("/login")
    @ApiOperation(value = "登录接口",notes = "传入小程序的code,进行登录，若用户未注册过则进行注册")

    public ResponseEntity login(@ApiParam(value = "小程序code,必须传入") @RequestParam String code,@ApiParam(value = "非必须参数,邀请者的ID") Integer invitorid){
        userInfoService.login(code);
        ResponseEntity responseEntity = new ResponseEntity();
        responseEntity.clientError();
        return responseEntity;
    }
}
