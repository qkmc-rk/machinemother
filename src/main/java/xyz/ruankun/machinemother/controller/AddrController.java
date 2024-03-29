package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Addr;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.service.AddrService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.MD5Util;
import xyz.ruankun.machinemother.util.code.AddrCode;
import xyz.ruankun.machinemother.util.code.UserCode;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin
@Api(value = "与用户地址相关的API")
public class AddrController {

    @Autowired
    private AddrService addrService;

    @Autowired
    private UserInfoService userInfoService;

    private Log logger = LogFactory.getLog(AddrController.class);

    @GetMapping(value = "/addr")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]获取制定获取的所有收货地址信息", notes = "确保传入的是有效的用户id值")
    public ResponseEntity getUserAddrs(@RequestHeader(value = "token") String token) {
        Integer userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
        List<Addr> addrs = addrService.myAddr(userId);
        return ControllerUtil.getDataResult(addrs);
    }

    @GetMapping(value = "/addr/{addrId}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]查看指定地址的详细信息", notes = "返回单个地址")
    public ResponseEntity getAddr(@PathVariable(value = "addrId") int addrId) {
        ResponseEntity responseEntity = new ResponseEntity();
        Addr addr = addrService.getAddr(addrId);
        if (addr == null) {
            responseEntity.error(Constant.FAILURE_CODE, "没有找到这个addr", null);
        } else if (addr.getId() == 0) {
            responseEntity.error(-1, AddrCode.NO_SUCH_Addr, null);
        } else {
            responseEntity.success(addr);
        }
        return responseEntity;
    }

    /**
     * 增加手机号正则检测    Jason   07-28
     *
     * @param addr
     * @return
     */
    @PostMapping(value = "/addr")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]增加用户接口信息", notes = "切记别上传id")
    public ResponseEntity add(@RequestBody Addr addr) {
        ResponseEntity responseEntity = new ResponseEntity();
        //若满足正则判断
        if (MD5Util.parsePhone(addr.getPhone())) {
            User user = userInfoService.getUser(addr.getUserId());
            if (user == null) {
                responseEntity.error(-1, "服务器故障,传到服务器的 userId: " + addr.getUserId(), null);
            } else if (user.getId() == 0) {
                responseEntity.error(-1, UserCode.NO_SUCH_USER, null);
//            responseEntity.serverError();
            } else {
                List<Addr> addrs = addrService.myAddr(addr.getUserId());
                //单个用户最多只能拥有5条地址数据
                if (addrs.size() > 4) {
                    responseEntity.error(-1, AddrCode.INVALID_MSG, null);
//                responseEntity.serverError();
                } else {
                    addr.setGmtCreate(new Date());
                    addr.setGmtModified(new Date());
                    addr.setVisible(true);          //既然是新增和更新，那么这条数据必然是可见的
                    Boolean result = addrService.add(addr);
                    if (!result) {
                        responseEntity.error(-1, AddrCode.FAILURE_MSG, null);
//                    responseEntity.serverError();
                    } else {
                        responseEntity.success(addr);
                    }
                }
            }
        } else {
            responseEntity.error(-1, "非法手机号", null);
        }
        return responseEntity;
    }

    @DeleteMapping(value = "/addr/{addrId}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]删除某条地址数据")
    public ResponseEntity delete(@PathVariable(value = "addrId") int addrId) {
        Addr addr = addrService.getAddr(addrId);
        ResponseEntity responseEntity = new ResponseEntity();
        if (addr == null) {
            responseEntity.serverError();
        } else if (addr.getId() == 0) {
            responseEntity.error(-1, AddrCode.NO_SUCH_Addr, null);
        } else {
            responseEntity = ControllerUtil.parData(addrService.delete(addrId), null);
        }
        return responseEntity;
    }

//    @GetMapping(value = "/addrs")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[admin]获取所有地址数据")
    public ResponseEntity get(@RequestParam(value = "page", required = false, defaultValue = "0") Integer page) {
        if (page < 1) {
            page = 1;
        }
        Pageable pageable = PageRequest.of(page - 1, 10);
        ResponseEntity responseEntity = new ResponseEntity();
        Page<Addr> addrs = addrService.addrs(pageable);
        if (addrs == null) {
            responseEntity.error(-1, "获取地址数据失败", null);
        } else {
            responseEntity.success(1, "操作成功", addrs);
        }

        return responseEntity;
    }


    @GetMapping(value = "/addrs/{addrId}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[admin]获取指定地址")
    public ResponseEntity addr(@PathVariable(value = "addrId") Integer addrId) {
        ResponseEntity responseEntity = new ResponseEntity();
        Addr addr = addrService.getAddr(addrId);
        if (addr.getId() == 0) {
            responseEntity.error(-1, "地址数据不存在", null);
        } else {
            responseEntity.success(1, "操作成功", addr);
        }
        return responseEntity;
    }

//    @GetMapping(value = "/addrs/{userId}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[admin]获取指定用户地址数据")
    public ResponseEntity addrs(@PathVariable(value = "userId") Integer userId) {
        ResponseEntity responseEntity = new ResponseEntity();
        List<Addr> addrs = addrService.myAddr(userId);
        if (addrs == null) {
            responseEntity.error(-1, "获取地址数据失败", null);
        } else {
            responseEntity.success(1, "操作成功", addrs);
        }
        return responseEntity;
    }
}
