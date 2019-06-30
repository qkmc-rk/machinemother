package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Addr;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.service.AddrService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.code.AddrCode;
import xyz.ruankun.machinemother.util.code.UserCode;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(value = "/addr")
@Api(value = "与用户地址相关的API")
public class AddrController {

    @Autowired
    private AddrService addrService;

    @Autowired
    private UserInfoService userInfoService;

    @GetMapping(value = {"", "/"})
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]获取制定获取的所有收货地址信息", notes = "确保传入的是有效的用户id值")
    public ResponseEntity getUserAddrs(@RequestHeader(value = "token") String token) {
        Integer userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
//        User user = userInfoService.getUser(userId);
        ResponseEntity responseEntity = new ResponseEntity();
//////        if (user == null) {
//////            responseEntity.error(UserCode.NO_EXIST, UserCode.NO_SUCH_USER, null);
//////           responseEntity.serverError();
////        } else {
//            List<Addr> addrs = addrService.myAddr(userId);
//            responseEntity.success( addrs);
//        }
        List<Addr> addrs = addrService.myAddr(userId);

        return ControllerUtil.getDataResult(addrs);
    }

    @GetMapping(value = "/{addrId}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]查看指定地址的详细信息", notes = "返回单个地址")
    public ResponseEntity getAddr(@PathVariable(value = "addrId") int addrId) {
        ResponseEntity responseEntity = new ResponseEntity();
        Addr addr = addrService.getAddr(addrId);
        if (addr == null) {
//            responseEntity.error(AddrCode.ERROR_PARAMS, "", null);
            responseEntity.serverError();
        } else if (addr.getId() == 0) {
            responseEntity.error(-1, AddrCode.NO_SUCH_Addr, null);
        } else {
            responseEntity.success(addr);
        }
        return responseEntity;
    }

    @PostMapping(value = "")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]增加用户接口信息", notes = "切记别上传id")
    public ResponseEntity add(@RequestBody Addr addr) {
        ResponseEntity responseEntity = new ResponseEntity();
        User user = userInfoService.getUser(addr.getUserId());
        if (user == null) {
            responseEntity.error(-1, "服务器故障", null);
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
                Boolean result = addrService.add(addr);
                if (!result) {
                    responseEntity.error(-1, AddrCode.FAILURE_MSG, null);
//                    responseEntity.serverError();
                } else {
                    responseEntity.success(addr);
                }
            }
        }
        return responseEntity;
    }

    @DeleteMapping(value = "/{addrId}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]删除某条地址数据")
    public ResponseEntity delete(@PathVariable(value = "addrId") int addrId) {
        Addr addr = addrService.getAddr(addrId);
        ResponseEntity responseEntity = new ResponseEntity();
        if (addr == null) {
//            responseEntity.error(AddrCode.NO_EXIST, AddrCode.NO_SUCH_Addr, null);
            responseEntity.serverError();
        } else if (addr.getId() == 0) {
            responseEntity.error(-1, AddrCode.NO_SUCH_Addr, null);
        } else {
//            Boolean result = addrService.delete(addrId);
//            if (result) {
//                responseEntity.success( null);
//            } else {
//                responseEntity.error(AddrCode.INVALID_OPERATION, AddrCode.INVALID_MSG, null);
//            }
            responseEntity = ControllerUtil.parData(addrService.delete(addrId), null);
        }
        return responseEntity;
    }

}
