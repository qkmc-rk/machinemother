package xyz.ruankun.machinemother.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.vo.ResponseEntity;

@RestController
@CrossOrigin
@RequestMapping("/user")
public class UserInfoController {

    @Autowired
    UserInfoService userInfoService;

    @RequestMapping("/login")
    public ResponseEntity login(@RequestParam String code){
        userInfoService.login(code);
        ResponseEntity responseEntity = new ResponseEntity();
        responseEntity.clientError();
        return responseEntity;
    }
}
