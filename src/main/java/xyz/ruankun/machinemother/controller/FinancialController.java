package xyz.ruankun.machinemother.controller;

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
public class FinancialController {

    @Autowired
    FinancialService financialService;
    @Autowired
    UserInfoService userInfoService;

    //管理员查询用户钱包信息
    @GetMapping("user/{id}/wallet")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity userWallet(@PathVariable Integer id){
       return ControllerUtil.getDataResult(financialService.selectWallet(id));
    }
    //管理员查询用户佣金记录
    @GetMapping("/user/{userid}/commission")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity userCommission(@PathVariable Integer userid){
        return ControllerUtil.getDataResult(financialService.findAllCommissionRecord(userid));
    }
    //管理员查询用户积分记录
    @GetMapping("/user/{userid}/credit")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity userCredit(@PathVariable Integer userid){
        return ControllerUtil.getDataResult(financialService.findAllCreditRecord(userid));
    }
    //用户查询自己钱包
    @GetMapping("/wallet")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity myWallet(@RequestHeader("token") String token){
        String userIdStr = userInfoService.readDataFromRedis(token);
        Integer userid = Integer.parseInt(userIdStr);
        return ControllerUtil.getDataResult(financialService.selectWallet(userid));
    }
    //用户查询自己的积分记录
    @GetMapping("/credit")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity myCredit(@RequestHeader("token") String token){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        return ControllerUtil.getDataResult(financialService.findAllCreditRecord(userid));
    }

    //用户查询自己的佣金记录
    @GetMapping("/commission")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity myCommission(@RequestHeader("token") String token){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        return ControllerUtil.getDataResult(financialService.findAllCommissionRecord(userid));
    }
    //用户拿取order的secret，当用户下单后会生成这个
    @GetMapping("/order/{orderid}/secret")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity getOrderSecret(@RequestHeader("token") String token,@PathVariable Integer orderid){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        return ControllerUtil.getDataResult(financialService.GetSecretByOrderIdAndUserId(orderid,userid));
    }
    //管理员确认订单
    @Authentication(role = AuthAopConstant.ADMIN)
    @PostMapping("/order/{orderid}")
    public ResponseEntity confirmOrder(@PathVariable Integer orderid, @RequestParam String secret){
        return ControllerUtil.getTrueOrFalseResult(financialService.confirmOrder(orderid, secret));
    }
    //用户获取优惠券信息
    @GetMapping("/decoupon")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity getDecoupon(@RequestHeader("token") String token){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
       return ControllerUtil.getDataResult(financialService.findAllDecouponByUserId(userid));
    }
    //用户兑换优惠券，同时要更改decoupon cdkey的值
    @PostMapping("/decoupon")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity saveDecoupon(@RequestHeader("token") String token, String decouponKey){
        Integer userid = Integer.parseInt(userInfoService.readDataFromRedis(token));
        Decoupon decoupon = financialService.convertDecoupon(userid, decouponKey);
        return ControllerUtil.getDataResult(decoupon);
    }
    //管理员生成一定数量的优惠券兑换码
    //优惠券的一些信息需要管理员填写
    @PutMapping("/decoupon")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity addDecoupon(@RequestParam Integer totalNum, @RequestBody Decoupon decoupon){
        return ControllerUtil.getDataResult(financialService.generateDecouponCDKey(totalNum,decoupon));
    }
    //管理员查询所有的兑换券信息(包含过期的，已经兑换的)
    @GetMapping("/cdkey")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity getAllCDKey(){
        return ControllerUtil.getDataResult(financialService.findAllCdKey());
    }
    //管理员给用户发放一张优惠券
    @GetMapping("/user/{userid}/decoupon")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity giveDecouponToUser(@PathVariable Integer userid, @RequestBody Decoupon decoupon){
        return ControllerUtil.getDataResult(financialService.giveDecouponToUser(userid,decoupon));
    }
    //管理员给每个用户发放一张优惠券
    @GetMapping("/user/decoupon")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity giveDecouponToAllUser(@RequestBody Decoupon decoupon){
        return ControllerUtil.getDataResult(financialService.giveDecouponToAllUser(decoupon));
    }

    //用户通过订单获取预支付信息
    @GetMapping("/order/{orderid}/prepay")
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