package xyz.ruankun.machinemother.controller;

import com.sun.org.apache.xpath.internal.operations.Bool;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Item;
import xyz.ruankun.machinemother.entity.Order;
import xyz.ruankun.machinemother.entity.OrderSecret;
import xyz.ruankun.machinemother.service.EconService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import javax.validation.constraints.AssertFalse;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
@Api(value = "电商相关接口，订单购物车等，同ecomController")
public class EconController {

    @Autowired
    private EconService econService;
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private ResponseEntity responseEntity;

    //userId 与 productId 算是item表中的一组候选码
    /*@PutMapping(value = "/item") 版本1关闭*/
//    @Authentication(role = AuthAopConstant.USER)
//    @ApiOperation(value = "添加商品至Cart列表中", notes = "需要传入数量")
//    public ResponseEntity addCart(@RequestParam(value = "productId") Integer productId,
//                                  @RequestParam(value = "number") Integer number,
//                                  @RequestParam(value = "productType") Integer productType,
//                                  @RequestHeader(value = "token") String token) {
//        int userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
//        Item item = new Item();
//        item.setGmtCreate(new Date());
//        item.setGmtModified(new Date());
//        item.setProductId(productId);
//        item.setProductPropsId(productType);
//        item.setUserId(userId);
//        item.setQuantity(number);
//        Boolean result = econService.addItem(item);
//        return ControllerUtil.getTrueOrFalseResult(result);
//    }

    //@PostMapping(value = "/item/{id}")                版本1关闭
//    @Authentication(role = AuthAopConstant.USER)
//    @ApiOperation(value = "改变item数量")
//    public ResponseEntity changItemCount(@RequestParam(value = "number") Integer number,
//                                         @PathVariable(value = "id") Integer id) {
//        Item item = econService.getItem(id);
//        if (item == null) {
//            responseEntity.serverError();
//        } else {
//            int count = item.getQuantity() - number;
//            if (count <= 0) {       //不可等于0，等于0相当于执行删除操作
//                responseEntity.serverError();
//            } else {
//                Boolean result = econService.updateItem(item);
//                responseEntity = ControllerUtil.getTrueOrFalseResult(result);
//            }
//        }
//        return responseEntity;
//    }

    @DeleteMapping(value = "/item/{id}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]删除购物车中的某个服务物品")
    public ResponseEntity deleteItem(@PathVariable(value = "id") Integer id) {
        Boolean result = econService.deleteItem(id);
        return ControllerUtil.getTrueOrFalseResult(result);
    }

    //@PostMapping(value = "/order")                版本1关闭
//    @Authentication(role = AuthAopConstant.USER)
//    @ApiOperation(value = "生成order")
//    public ResponseEntity order(@RequestHeader(value = "token") String token,
//                                @RequestParam(value = "decouponId") Integer decouponId,
//                                @RequestParam(value = "useCredit") Boolean useCredit,
//                                @RequestParam(value = "credit") Integer credit,
//                                @RequestParam(value = "addrId") Integer addrId) {
//        int userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
//        Order order = econService.addOrder(userId, decouponId, useCredit, credit, addrId);
//        return ControllerUtil.getDataResult(order);
//    }

    //@PostMapping(value = "/prepay/{orderId}")         版本1关闭
//    @Authentication(role = AuthAopConstant.USER)
//    @ApiOperation(value = "发起支付请求")
//    @Deprecated
//    public ResponseEntity prepay(@PathVariable(value = "orderId") Integer orderId) {
//        //depreated
//        return responseEntity;
//    }

    //@PostMapping(value = "/order/{id}")               版本1关闭
//    @Authentication(role = AuthAopConstant.USER)
//    @ApiOperation(value = "支付完成后")
//    @Deprecated
//    public ResponseEntity afterPay(@RequestParam(value = "paid") Boolean paid, @PathVariable(value = "id") Integer id) {
//        //deprecate
//        return responseEntity;
//    }

    @GetMapping(value = "/order")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]获取用户所有order", notes = "通过token获取userId, 筛选")
    public ResponseEntity getOrders(@RequestHeader(value = "token") String token) {
        int userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
        List<Order> orders = econService.getOrders(userId);
        return ControllerUtil.getDataResult(orders);
    }

    @GetMapping(value = "/order/{orderId}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]查看某条order详情")
    public ResponseEntity getOrder(@PathVariable(value = "orderId") Integer orderId,
                                   @RequestHeader(value = "token") String token) {
        Order order = econService.getOrder(orderId);
        if (order == null) {
            responseEntity.serverError();
        } else {
            Integer userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
            if (userId == order.getUserId()) {
                responseEntity.success(order);
            } else {
                responseEntity.serverError();
            }
        }
        return responseEntity;
    }

    @PostMapping(value = "/order/{orderId}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]确认order完成， 从用户获取orderSecret")
    @Deprecated
    public ResponseEntity verifyOrder(@RequestParam(value = "orderSecret") String orderSecret,
                                      @RequestParam(value = "password") String password,
                                      @PathVariable(value = "orderId") Integer orderId) {
        Boolean rs = econService.confirmOrder(orderSecret, orderId);
        return ControllerUtil.getTrueOrFalseResult(rs);
    }

    @GetMapping(value = "/user/{userId}/orders")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]通过用户id查询所有order")
    public ResponseEntity getOrders(@PathVariable(value = "userId") Integer userId) {
        List<Order> orders = econService.getOrders(userId);
        return ControllerUtil.getDataResult(orders);
    }

    @GetMapping(value = "/orders")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]获取全部order")
    public ResponseEntity getOrders(@RequestParam(value = "page") Integer page,
                                    @RequestParam(value = "limit") Integer limit) {
        Pageable pageable = PageRequest.of(page - 1, limit);
        Page<Order> orders = econService.getOrders(pageable);
        return ControllerUtil.getDataResult(orders);
    }

    @DeleteMapping(value = "/order/id")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]删除指定order")
    public ResponseEntity deleteOrder(@PathVariable(value = "id") Integer id) {
        //需order创建时间超过三小时,且状态为unpaid的才可进行该操作
        Order order = econService.getOrder(id);
        Date date = new Date();
        Long time = date.getTime() - order.getGmtCreate().getTime();
        if (time > 1000 * 60 * 60 * 3 && !order.getPaid()) {
            Boolean result = econService.deleteOrder(id);
            responseEntity = ControllerUtil.getTrueOrFalseResult(result);
        } else {
            responseEntity.serverError();
        }
        return responseEntity;
    }
}
