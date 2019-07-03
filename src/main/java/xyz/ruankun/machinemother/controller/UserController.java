package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.code.UserCode;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/user")
@Api(value = "用户模块相关的操作由userController来实现")
public class UserController {

    @Autowired
    UserInfoService userInfoService;

    /**
     * 用户登录方法
     *
     * @param code 微信小程序code
     * @return 参照代码
     */
    @PostMapping("/token")
    @ApiOperation(value = "登录接口", notes = "[匿名]传入小程序的code,进行登录,登录要做成restful API，必须跟资源联系起来，登录对应操作的是token")
    public ResponseEntity login(@ApiParam(value = "小程序code,必须传入") @RequestParam String code) {
        Integer rs = userInfoService.login(code);
        ResponseEntity responseEntity = new ResponseEntity();

        /**
         * 以下逻辑：
         *    成功，则从返回的userId从redis拿到token 送给用户
         *    失败：根据失败的根源返回不同的失败信息
         */
        if (rs.equals(Constant.LOGIN_NO_USER)) {
            //用户未注册
            responseEntity.error(Constant.LOGIN_NO_USER, "login failed cause not regist", null);
        } else if (rs.equals(Constant.LOGIN_CODE_ERROR)) {
            //传入的code有误
            responseEntity.error(Constant.LOGIN_CODE_ERROR, "login failed cause code error", null);
        } else if (rs.equals(Constant.LOGIN_CODE_USED)) {
            //该code已经被使用
            responseEntity.error(Constant.LOGIN_CODE_USED, "login failed cause code has been used", null);
        } else if (rs.equals(Constant.LOGIN_SERVER_ERROR)) {
            responseEntity.error(Constant.LOGIN_SERVER_ERROR, "login failed cause cache failed", null);
        } else {
            //登录成功 返回的是userid
            String token = userInfoService.readDataFromRedis("token" + rs.intValue());
            responseEntity.success(Constant.LOGIN_SUCCESS, "login success", token);
        }
        return responseEntity;
    }

    /**
     * 注册API
     *
     * @param code      微信小程序code
     * @param name      用户微信昵称
     * @param avator    头像
     * @param invitorId 邀请者ID
     * @return
     */
    @PostMapping(value = {"", "/", "/register"})
    @ApiOperation(value = "[匿名]用户注册", notes = "传入用户信息，然后进行注册,微信小程序注册只需传入基础信息即可，重点在code")
    public ResponseEntity register(@ApiParam(value = "小程序的code") @RequestParam String code,
                                   @ApiParam(value = "拉取的微信昵称") @RequestParam String name,
                                   @ApiParam(value = "微信头像地址") @RequestParam String avator,
                                   @ApiParam(value = "邀请人的ID,扫分享码进入的小程序，则一定可以把分享者id带过来，这个非必须参数") @RequestParam(required = false) Integer invitorId) {
        //将数据传入userInfoService进行注册
        User user = new User();
        user.setAvator(avator);
        user.setInvitorId(invitorId);
        user.setName(name);
        Integer rs = userInfoService.register(code, user);
        ResponseEntity responseEntity = new ResponseEntity();
        if (rs.equals(Constant.REGISTER_ALREADY_DOWN)) {
            //用户未注册
            responseEntity.error(Constant.REGISTER_ALREADY_DOWN, "REGISTER_ALREADY_DOWN", null);
        } else if (rs.equals(Constant.REGISTER_CODE_ERROR)) {
            //传入的code有误
            responseEntity.error(Constant.REGISTER_CODE_ERROR, "REGISTER_CODE_ERROR", null);
        } else if (rs.equals(Constant.REGISTER_CODE_USED)) {
            //该code已经被使用
            responseEntity.error(Constant.REGISTER_CODE_USED, "REGISTER_CODE_USED", null);
        } else if (rs.equals(Constant.REGISTER_SERVER_ERROR)) {
            responseEntity.error(Constant.REGISTER_SERVER_ERROR, "REGISTER_SERVER_ERROR", null);
        } else {
            //注册成功 返回的是userid
            String token = userInfoService.readDataFromRedis("token" + rs.intValue());
            responseEntity.success(Constant.LOGIN_SUCCESS, "register and login success", token);
        }
        return responseEntity;
    }

    /**
     * 获取所有用户信息
     *
     * @param page   page.range(0, maxSize);
     * @param size
     * @param column
     * @param sort
     * @return
     */
    @GetMapping(value = {"", "/all", "/"})
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]获取所有用户信息", notes = "传入请求的用户所需的相关分页数据，page取值范围为(0,length-1),默认按照id排序")
    public ResponseEntity getUsers(@ApiParam(value = "页号") @RequestParam(value = "page", defaultValue = "0") int page, @RequestParam(value = "size") Integer size,
                                   @ApiParam(value = "排序所需的列名") @RequestParam(value = "column", required = false, defaultValue = "id") String column,
                                   @ApiParam(value = "排序方式") @RequestParam(value = "sort", required = false, defaultValue = "true") Boolean sort) {
        ResponseEntity responseEntity = new ResponseEntity();
        Pageable pageable = pageable(page, size, column, sort);
        Page<User> users = userInfoService.getAll(pageable);
        if (users.getTotalPages() < page) {
//            responseEntity.error(UserCode.ERROR_PARAMS, UserCode.INVALID_DATA, null);
            responseEntity.serverError();
        } else {
            responseEntity.success(users);
        }
        return responseEntity;
    }

    @PostMapping("/{userId}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]更新用户数据")
    public ResponseEntity updateUser(@RequestBody User user, @PathVariable(value = "userId") Integer userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        System.out.println("已经调用修改用户方法");
        if (!userId.equals(user.getId())) {
            responseEntity.error(Constant.AUTH_ERROR, "userId is not equal", null);
        } else {
            user = userInfoService.update(user);
            if (user == null) {
                responseEntity.serverError();
            } else {
                responseEntity.success(user);
            }
        }
        return responseEntity;
    }

    @GetMapping(value = "/{userId}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]获取用户数据")
    public ResponseEntity getUser(@PathVariable(value = "userId") int userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        User user = userInfoService.getUser(userId);
        if (user.getId() == 0) {
            responseEntity.error(-1, "用户不存在", null);
        } else if (user == null) {
//            responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
            responseEntity.serverError();
        } else {
            responseEntity.success(user);
        }
        return responseEntity;
    }

    @PostMapping(value = "/userInfo")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]更新用户数据", notes = "仅可更新用户名， 手机号，以及微信id(微信id仅可更新一次，若表内不为空，则不可操作)")
    public ResponseEntity update(@RequestBody User user, @RequestHeader(value = "token") String token) {

        //去除敏感信息
        user.setInvitorId(null);
        user.setOpenId(null);
        user.setAward(null);
        user.setGmtCreate(null);
        user.setGmtModified(null);
        user.setIntegration(null);

        ResponseEntity responseEntity = new ResponseEntity();
        try {
            int userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
            //保证能够字符串与整数能够正确转型
            if (userId != user.getId()) {
//                responseEntity.error(UserCode.ERROR_DATA, UserCode.INVALID_DATA, null);
                responseEntity.error(Constant.AUTH_ERROR, "userId is not equal", null);
            } else {
//                User check = userInfoService.getUser(userId);
                user = userInfoService.update(user);
                responseEntity.success(user);
//                } else {
                //
//                    responseEntity.error(UserCode.INVALID_OPERATION, UserCode.INVALID_MSG, null);
//                }
            }
        } catch (Exception e) {
//            responseEntity.error(UserCode.ERROR_PARAMS, UserCode.INVALID_DATA, null);
            responseEntity.serverError();
            e.printStackTrace();
        }

        return responseEntity;
    }

    @GetMapping(value = "/userInfo")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]获取用户自身数据")
    public ResponseEntity getUser(@RequestHeader(value = "token") String token) {
        ResponseEntity responseEntity = new ResponseEntity();
        try {
            int userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
            User user = userInfoService.getUser(userId);
            if (user.getId() == 0) {
                responseEntity.error(-1, "用户不存在", null);
            } else if (user == null) {
//                responseEntity.error(UserCode.ERROR_DATA, UserCode.LOST_DATA, null);
                responseEntity.serverError();
            } else {
                user.setOpenId(null);
                responseEntity.success(user); //之前怎么会填写null呢
            }
        } catch (Exception e) {
//            responseEntity.error(UserCode.ERROR_PARAMS, UserCode.INVALID_DATA, null);
            responseEntity.serverError();
            e.printStackTrace();
        }
        return responseEntity;
    }

    @DeleteMapping(value = "/{userId}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]删除指定用户数据")
    public ResponseEntity delete(@PathVariable(value = "userId") Integer userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        User user = userInfoService.getUser(userId);
        if (user.getId() == 0) {
            responseEntity.error(-1, "用户不存在", null);
        } else if (user == null) {
            responseEntity.error(Constant.FAILURE_CODE, "user doesn't exist", null);
        } else {
            Integer rs = userInfoService.delete(userId);
            if (rs < 0) {
                responseEntity.error(Constant.FAILURE_CODE, "delete failed", null);
            } else {
                responseEntity.success("delete successfully");
            }
        }
        return responseEntity;
    }

    @PostMapping(value = "/{userId}/award")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]更新用户佣金获得额度", notes = "所传入的佣金金额不能小于0")
    public ResponseEntity updateAward(@RequestParam(value = "award") Double award, @PathVariable(value = "userId") int userId) {
        User user = userInfoService.getUser(userId);
        ResponseEntity responseEntity = new ResponseEntity();
        if (user.getId() == 0) {
            responseEntity.error(-1, "用户不存在", null);
        } else if (user == null) {
//            responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
            responseEntity.serverError();
        } else {
            if (award < 0) {
                responseEntity.error(-1, UserCode.INVALID_DATA, null);
                //responseEntity.serverError();
            } else {
                user.setAward(award);
                userInfoService.update(user);
                responseEntity.success(null);
            }
        }
        return responseEntity;
    }

    @PostMapping(value = "/{userId}/integration")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]更新用户获得积分的额度", notes = "所传入的积分数据不能小于0")
    public ResponseEntity updateIntegration(@RequestParam(value = "integration") Integer integration, @PathVariable("userId") int userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        if (integration < 0) {
            responseEntity.error(-1, UserCode.INVALID_DATA, null);
            //responseEntity.serverError();
        } else {
            User user = userInfoService.getUser(userId);
            if (user.getId() == 0) {
                responseEntity.error(-1, "用户不存在", null);
            } else if (user == null) {
                responseEntity.error(-1, UserCode.NO_SUCH_USER, null);
                //responseEntity.serverError();
            } else {
                user.setIntegration(integration);
                userInfoService.update(user);
                responseEntity.success(null);
            }
        }
        return responseEntity;
    }

    @PostMapping(value = "/{userId}/weixin")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]用户绑定微信", notes = "若用户已绑定，则返回失败")
    public ResponseEntity saveWX(@RequestParam(value = "weixinId") String wxId, @PathVariable(value = "userId") int userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        User user = userInfoService.getUser(userId);
        if (user.getId() == 0) {
            responseEntity.error(-1, "用户不存在", null);
        } else if (user == null) {
//            responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
            responseEntity.serverError();
        } else {

            if (user.getWxId() != null) {
                responseEntity.error(-1, UserCode.INVALID_DATA, null);
                //responseEntity.serverError();
            } else {
                user.setWxId(wxId);
                user.setGmtModified(new Date());
                userInfoService.update(user);
                responseEntity.success(null);
            }
        }
        return responseEntity;
    }

    @GetMapping(value = "/fans")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "粉丝接口")
    public ResponseEntity fans(@RequestHeader(value = "token") String token) {
        ResponseEntity responseEntity = new ResponseEntity();
        Integer userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
        List<User> users = userInfoService.getUsers(userId);
        if (users == null) {
            responseEntity.serverError();
        } else {
            responseEntity.success(users);
        }
        return responseEntity;
    }

//    @GetMapping("/test")
//    @ApiOperation(value = "勿动")
//    public String test(@RequestParam(value = "openId")String openId){
//        Boolean result = userInfoService.delete(openId);
//        return String.valueOf(result);
//    }

    private Pageable pageable(int page, int size, String column, Boolean sort) {
        if (column == null) {
            return PageRequest.of(page, size);
        } else {
            //如果sort为真则从小到大
            if (sort) {
                return PageRequest.of(page, size, Sort.Direction.ASC, column);
            } else {
                return PageRequest.of(page, size, Sort.Direction.DESC, column);
            }
        }
    }
}
