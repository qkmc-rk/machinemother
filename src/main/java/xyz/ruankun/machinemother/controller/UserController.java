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
    @ApiOperation(value = "登录接口", notes = "传入小程序的code,进行登录,登录要做成restful API，必须跟资源联系起来，登录对应操作的是token")
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
    @ApiOperation(value = "用户注册", notes = "传入用户信息，然后进行注册,微信小程序注册只需传入基础信息即可，重点在code")
    public ResponseEntity register(@ApiParam(value = "小程序的code") @RequestParam String code,
                                   @ApiParam(value = "拉取的微信昵称") @RequestParam String name,
                                   @ApiParam(value = "微信头像地址") @RequestParam String avator,
                                   @ApiParam(value = "邀请人的ID,扫分享码进入的小程序，则一定可以把分享者id带过来，这个非必须参数") Integer invitorId) {
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
    @ApiOperation(value = "获取所有用户信息", notes = "传入请求的用户所需的相关分页数据，page取值范围为(0,length-1),默认按照id排序")
    public ResponseEntity getUsers(@ApiParam(value = "页号") @RequestParam(value = "page", defaultValue = "0") int page, @RequestParam(value = "size") int size,
                                   @ApiParam(value = "排序所需的列名") @RequestParam(value = "column", required = false, defaultValue = "id") String column,
                                   @ApiParam(value = "排序方式") @RequestParam(value = "sort", required = false, defaultValue = "0") int sort) {
        ResponseEntity responseEntity = new ResponseEntity();
        Pageable pageable = pageable(page, size, column, sort);
        Page<User> users = userInfoService.getAll(pageable);
        if (users.getTotalPages() < page) {
            responseEntity.error(UserCode.ERROR_PARAMS, UserCode.INVALID_DATA, null);
        } else {
            responseEntity.success(UserCode.SUCCESS_OPERATION, UserCode.SUCCESS_MSG, users);
        }
        return responseEntity;
    }

    @PostMapping("/{userId}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "更新用户数据", notes = "仅可更新手机号，名称")
    public ResponseEntity updateUser(User user, @PathVariable(value = "userId") int userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        if (userId != user.getId()) {
            responseEntity.error(UserCode.ERROR_PARAMS, "请检查参数是否正确！", null);
        } else {
            user.setGmtModified(new Date());
            user = userInfoService.update(user);
            if (user == null) {
                responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
            } else {
                responseEntity.success(UserCode.SUCCESS_OPERATION, UserCode.SUCCESS_MSG, user);
            }
        }
        return responseEntity;
    }

    @GetMapping(value = "/{userId}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "获取用户数据")
    public ResponseEntity getUser(@PathVariable(value = "userId") int userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        User user = userInfoService.getUser(userId);
        if (user == null) {
            responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
        } else {
            responseEntity.success(UserCode.SUCCESS_OPERATION, UserCode.SUCCESS_MSG, user);
        }
        return responseEntity;
    }

    @DeleteMapping(value = "/{userId}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "删除指定用户数据")
    public ResponseEntity delete(@PathVariable(value = "userId") int userId) {
        User user = userInfoService.getUser(userId);
        ResponseEntity responseEntity = new ResponseEntity();

        if (user == null) {
            responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
        } else {
            int result = userInfoService.delete(userId);
            if (result < 0) {
                responseEntity.error(UserCode.INVALID_OPERATION, UserCode.INVALID_DATA, null);
            } else {
                responseEntity.success(UserCode.SUCCESS_OPERATION, UserCode.SUCCESS_MSG, user);
            }
        }
        return responseEntity;
    }

    @PostMapping(value = "/{userId}/award")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "更新用户佣金获得额度", notes = "所传入的佣金金额不能小于0")
    public ResponseEntity updateAward(@RequestParam(value = "award") double award, @PathVariable(value = "userId") int userId) {
        User user = userInfoService.getUser(userId);
        ResponseEntity responseEntity = new ResponseEntity();
        if (user == null) {
            responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
        } else {
            if (award < 0) {
                responseEntity.error(UserCode.ERROR_PARAMS, UserCode.INVALID_DATA, null);
            } else {
                user.setAward(award);
                userInfoService.update(user);
                responseEntity.success(UserCode.SUCCESS_OPERATION, UserCode.SUCCESS_MSG, null);
            }
        }
        return responseEntity;
    }

    @PostMapping(value = "/{userId}/integration")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "更新用户获得积分的额度", notes = "所传入的积分数据不能小于0")
    public ResponseEntity updateIntegration(@RequestParam(value = "integration") double integration, @RequestParam("userId") int userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        if (integration < 0) {
            responseEntity.error(UserCode.ERROR_PARAMS, UserCode.INVALID_DATA, null);
        } else {
            User user = userInfoService.getUser(userId);
            if (user == null) {
                responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
            } else {
                user.setIntegration(integration);
                userInfoService.update(user);
                responseEntity.success(UserCode.SUCCESS_OPERATION, UserCode.SUCCESS_MSG, null);
            }
        }
        return responseEntity;
    }

    @PostMapping(value = "/{userId}/weixin")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "用户绑定微信", notes = "若用户已绑定，则返回失败")
    public ResponseEntity saveWX(@RequestParam(value = "weixinId") String wxId, @PathVariable(value = "userId") int userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        User user = userInfoService.getUser(userId);
        if (user == null) {
            responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
        } else {
            if (user.getWxId() != null) {
                responseEntity.error(UserCode.ERROR_PARAMS, UserCode.INVALID_DATA, null);
            } else {
                user.setWxId(wxId);
                user.setGmtModified(new Date());
                userInfoService.update(user);
                responseEntity.success(UserCode.SUCCESS_OPERATION, UserCode.SUCCESS_MSG, null);
            }
        }
        return responseEntity;
    }

    private Pageable pageable(int page, int size, String column, int sort) {
        if (column == null) {
            return PageRequest.of(page, size);
        } else {
            if (sort == 1) {
                return PageRequest.of(page, size, Sort.Direction.ASC, column);
            } else {
                return PageRequest.of(page, size, Sort.Direction.DESC, column);
            }
        }
    }
}
