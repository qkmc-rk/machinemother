package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Decoupon;
import xyz.ruankun.machinemother.service.FinancialService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.WePayUtil;
import xyz.ruankun.machinemother.util.WxResponseCode;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
@CrossOrigin
@Api(value = "金融模块,一切与金钱积分等相关的都由金融模块实现")
public class FinancialController {

    @Autowired
    FinancialService financialService;
    @Autowired
    UserInfoService userInfoService;

    //管理员查询用户钱包信息
    @GetMapping("user/{id}/wallet")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]查询用户的钱包信息")
    public ResponseEntity userWallet(@PathVariable Integer id){
       return ControllerUtil.getDataResult(financialService.selectWallet(id));
    }
    //管理员查询用户佣金记录
    @GetMapping("/user/{userid}/commission")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]查询用户佣金记录，佣金记录，不是佣金")
    public ResponseEntity userCommission(@PathVariable Integer userid){
        return ControllerUtil.getDataResult(financialService.findAllCommissionRecord(userid));
    }
    //管理员查询用户积分记录
    @GetMapping("/user/{userid}/credit")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]查询用户的积分记录，积分记录不是积分")
    public ResponseEntity userCredit(@PathVariable Integer userid){
        return ControllerUtil.getDataResult(financialService.findAllCreditRecord(userid));
    }
    //用户查询自己钱包
    @GetMapping("/wallet")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]查询自己的钱包信息")
    public ResponseEntity myWallet(@RequestHeader("token") String token){
        String userIdStr = userInfoService.readDataFromRedis(token);
        Integer userid = Integer.parseInt(userIdStr);
        return ControllerUtil.getDataResult(financialService.selectWallet(userid));
    }
    //用户查询自己的积分记录
    @GetMapping("/credit")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]查询自己的积分记录信息")
    public ResponseEntity myCredit(@RequestHeader("token") String token){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        return ControllerUtil.getDataResult(financialService.findAllCreditRecord(userid));
    }

    //用户查询自己的佣金记录
    @GetMapping("/commission")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户查询自己的佣金记录信息]")
    public ResponseEntity myCommission(@RequestHeader("token") String token){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        return ControllerUtil.getDataResult(financialService.findAllCommissionRecord(userid));
    }
    //用户拿取order的secret，当用户下单付款后会生成这个
    @GetMapping("/order/{orderid}/secret")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]用户拿取order的secret，当用户下单付款后会生成这个")
    public ResponseEntity getOrderSecret(@RequestHeader("token") String token,@PathVariable Integer orderid){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        return ControllerUtil.getDataResult(financialService.GetSecretByOrderIdAndUserId(orderid,userid));
    }
    //管理员确认订单
    @Authentication(role = AuthAopConstant.ADMIN)
    @PostMapping("/order/{orderid}")
    @ApiOperation(value = "[管理员]管理员确认订单")
    public ResponseEntity confirmOrder(@PathVariable Integer orderid, @RequestParam String secret){
        return ControllerUtil.getTrueOrFalseResult(financialService.confirmOrder(orderid, secret));
    }
    //用户获取优惠券信息
    @GetMapping("/decoupon")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]获取优惠券信息")
    public ResponseEntity getDecoupon(@RequestHeader("token") String token){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
       return ControllerUtil.getDataResult(financialService.findAllDecouponByUserId(userid));
    }
    //用户兑换优惠券，同时要更改decoupon cdkey的值
    @PostMapping("/decoupon")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]通过管理员发放的cdkey兑换优惠券")
    public ResponseEntity saveDecoupon(@RequestHeader("token") String token, String decouponKey){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        Decoupon decoupon = financialService.convertDecoupon(userid, decouponKey);
        return ControllerUtil.getDataResult(decoupon);
    }
    //管理员生成一定数量的优惠券兑换码
    //优惠券的一些信息需要管理员填写
    @PutMapping("/decoupon")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]管理员生成一定数量的优惠券存放到数据库中")
    public ResponseEntity addDecoupon(@RequestParam Integer totalNum, @RequestBody Decoupon decoupon){
        return ControllerUtil.getDataResult(financialService.generateDecouponCDKey(totalNum,decoupon));
    }
    //管理员查询所有的兑换券信息(包含过期的，已经兑换的)
    @GetMapping("/cdkey")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]查询所有的优惠券兑换CDKEY的信息")
    public ResponseEntity getAllCDKey(){
        return ControllerUtil.getDataResult(financialService.findAllCdKey());
    }
    //管理员给用户发放一张优惠券
    @PutMapping("/user/{userid}/decoupon")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]给某个用户发放一张优惠券")
    public ResponseEntity giveDecouponToUser(@PathVariable Integer userid, @RequestBody Decoupon decoupon){
        return ControllerUtil.getDataResult(financialService.giveDecouponToUser(userid,decoupon));
    }
    //管理员给每个用户发放一张优惠券
    @PutMapping("/user/decoupon")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]给所有用户发放一张优惠券，重要方法")
    public ResponseEntity giveDecouponToAllUser(@RequestBody Decoupon decoupon){
        return ControllerUtil.getDataResult(financialService.giveDecouponToAllUser(decoupon));
    }

    //用户通过订单获取预支付信息
    @GetMapping("/order/{orderid}/prepay")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]获取预支付信息，点击支付按钮时调用")
    public ResponseEntity getPrepay(@RequestHeader("token")String token, @PathVariable Integer orderid, HttpServletRequest request){
        ResponseEntity responseEntity = new ResponseEntity();
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        Map<String,String> map = financialService.getPrepayInfo(orderid, userid,request);
        //这里返回的内容有三种情况：返回null,返回一个key为"error"的,返回一个成功的数据。
        if (map == null)
            responseEntity.error(WxResponseCode.ORDER_CHECKOUT_FAIL,"订单交易信息校验出错,联系管理员",null);
        if (map.get("error") != null)
            responseEntity.error(Constant.FAILURE_CODE,"",map);
        //成功了
        responseEntity.success(map);
        return responseEntity;
    }
    //用户支付完成后的回调地址
    @PostMapping("/order/prepay/notify")
    @ApiOperation(value = "[匿名]由服务器回调，当用户支付完成时会回调此接口，并传送支付信息给服务器")
    public String wxNotify(HttpServletRequest request){
        String rs = null;
        try {
            rs = financialService.orderNotify(request);
        } catch (Exception e) {
            e.printStackTrace();
            rs = WePayUtil.NOTIFY_FAIL_IO_ERROR;
        }
        return rs;
    }

    //用户提现相关的API
    //1.用户发起提现    2.管理员查询提现记录   3.用户查询自己的提现记录   4.管理员确认提现   5.管理员拒绝提现



}
