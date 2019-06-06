package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

@RestController
@CrossOrigin
@RequestMapping("/user")
@Api(value = "用户模块相关的操作由userController来实现")
public class UserInfoController {

    @Autowired
    UserInfoService userInfoService;

    /**
     * 用户登录方法
     * @param code 微信小程序code
     * @return 参照代码
     */
    @PostMapping("/token")
    @ApiOperation(value = "登录接口",notes = "传入小程序的code,进行登录,登录要做成restful API，必须跟资源联系起来，登录对应操作的是token")
    public ResponseEntity login(@ApiParam(value = "小程序code,必须传入") @RequestParam String code){
        Integer rs = userInfoService.login(code);
        ResponseEntity responseEntity = new ResponseEntity();

        /**
         * 以下逻辑：
         *    成功，则从返回的userId从redis拿到token 送给用户
         *    失败：根据失败的根源返回不同的失败信息
         */
        if(rs.equals(Constant.LOGIN_NO_USER)){
            //用户未注册
            responseEntity.error(Constant.LOGIN_NO_USER,"login failed cause not regist",null);
        }else if(rs.equals(Constant.LOGIN_CODE_ERROR)){
            //传入的code有误
            responseEntity.error(Constant.LOGIN_CODE_ERROR,"login failed cause code error",null);
        }else if(rs.equals(Constant.LOGIN_CODE_USED)){
            //该code已经被使用
            responseEntity.error(Constant.LOGIN_CODE_USED,"login failed cause code has been used",null);
        }else if(rs.equals(Constant.LOGIN_SERVER_ERROR)){
            responseEntity.error(Constant.LOGIN_SERVER_ERROR,"login failed cause cache failed",null);
        }else{
            //登录成功 返回的是userid
            String token = userInfoService.readDataFromRedis("token" + rs.intValue());
            responseEntity.success(Constant.LOGIN_SUCCESS,"login success",token);
        }
        return responseEntity;
    }

    /**
     * 注册API
     * @param code 微信小程序code
     * @param name 用户微信昵称
     * @param avator 头像
     * @param invitorId 邀请者ID
     * @return
     */
    @PostMapping("")
    @ApiOperation(value = "用户注册",notes = "传入用户信息，然后进行注册,微信小程序注册只需传入基础信息即可，重点在code")
    public ResponseEntity regist(@ApiParam(value = "小程序的code") @RequestParam String code,
                                 @ApiParam(value = "拉取的微信昵称")@RequestParam String name,
                                 @ApiParam(value = "微信头像地址")@RequestParam String avator,
                                 @ApiParam(value = "邀请人的ID,扫分享码进入的小程序，则一定可以把分享者id带过来，这个非必须参数") Integer invitorId){
        //将数据传入userInfoService进行注册
        User user = new User();
        user.setAvator(avator);
        user.setInvitorId(invitorId);
        user.setName(name);
        Integer rs = userInfoService.register(code,user);
        ResponseEntity responseEntity = new ResponseEntity();
        if(rs.equals(Constant.REGISTER_ALREADY_DOWN)){
            //用户未注册
            responseEntity.error(Constant.REGISTER_ALREADY_DOWN,"REGISTER_ALREADY_DOWN",null);
        }else if(rs.equals(Constant.REGISTER_CODE_ERROR)){
            //传入的code有误
            responseEntity.error(Constant.REGISTER_CODE_ERROR,"REGISTER_CODE_ERROR",null);
        }else if(rs.equals(Constant.REGISTER_CODE_USED)){
            //该code已经被使用
            responseEntity.error(Constant.REGISTER_CODE_USED,"REGISTER_CODE_USED",null);
        }else if(rs.equals(Constant.REGISTER_SERVER_ERROR)){
            responseEntity.error(Constant.REGISTER_SERVER_ERROR,"REGISTER_SERVER_ERROR",null);
        }else{
            //注册成功 返回的是userid
            String token = userInfoService.readDataFromRedis("token" + rs.intValue());
            responseEntity.success(Constant.LOGIN_SUCCESS,"register and login success",token);
        }
        return responseEntity;
    }
}
