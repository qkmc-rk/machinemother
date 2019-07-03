package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Item;
import xyz.ruankun.machinemother.service.EcomService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 电商模块的controller
 * 主要处理购物车，订单相关事务
 * 其中订单涉及到金额问题，可能跟金融模块有些界限模糊
 * 但这是必要的，提现模块间的联系
 * 就像细胞之间存在胞间连丝，可以相互交流
 * 男女之间也可以“交流”
 */
@RestController
@CrossOrigin
@Api(value = "电商相关接口，订单购物车等，同econController")
public class EcomController {
    @Autowired
    EcomService ecomService;
    @Autowired
    UserInfoService userInfoService;

    //将产品加入购物车,需要三个参数。Item就是cart的意思
    @PutMapping("/item")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]加入一个东东到购物车")
    public ResponseEntity addToItem(@RequestHeader("token") String token,
                                    @RequestParam Integer productId,
                                    @RequestParam Integer number,
                                    @RequestParam Integer productPropsId) {
        //因为已经通过了权限，所以此处不会抛出异常
        Integer userId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        Item item = new Item();
        item.setProductId(productId);
        item.setProductPropsId(productPropsId);
        item.setQuantity(number);
        item.setUserId(userId);
        item.setComment(false);         //未评价
        Item item1 = ecomService.putToItem(item);
        return ControllerUtil.getDataResult(item1);
    }

    //增加或者减少购物车里面的内容，需要判断，如果item的数量为0，直接删除
    @PostMapping("item/{id}")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]增加或者减少一个购物车物品的数量，减少到0会自动删除")
    public ResponseEntity changeItemNumber(@PathVariable Integer id,
                                           @RequestParam Boolean up,
                                           @RequestHeader("token") String token) {
        Integer userId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        boolean rs = ecomService.changeNumberOfItem(userId, id, up);
        return ControllerUtil.getTrueOrFalseResult(rs);
    }
    //order相关

    //生成订单，用户参数，以及订单折扣参数等，多重(多次)校验数据
    @PutMapping("/order")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]下订单，此处下单是将购物车中的所有服务下单")
    public ResponseEntity makeOrder(@RequestHeader("token") String token,
                                    @RequestParam(required = false) Integer decouponId,
                                    @RequestParam Boolean useCredit,
                                    @RequestParam Integer addrId) {
        Integer userId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        Map<String, Object> map = null;
        try {
            map = ecomService.generateOrder(userId, decouponId, useCredit, addrId);
            return ControllerUtil.getDataResult(map);
        } catch (Exception e) {
            e.printStackTrace();
            return ControllerUtil.getTrueOrFalseResult(false);
        }
    }

    @GetMapping(value = "/item")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]查看购物车")
    public ResponseEntity getItems(@RequestHeader(value = "token") String token) {
        ResponseEntity responseEntity = new ResponseEntity();
        Integer userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
        List<Item> items = ecomService.getItems(userId);
        if (items == null) {
            responseEntity.serverError();
        } else {
            responseEntity.success(items);
        }
        return responseEntity;
    }


}
