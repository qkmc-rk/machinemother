package xyz.ruankun.machinemother.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Item;
import xyz.ruankun.machinemother.service.EcomService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

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
public class EcomController {
    @Autowired
    EcomService ecomService;
    @Autowired
    UserInfoService userInfoService;

    //将产品加入购物车,需要三个参数。Item就是cart的意思
    @PutMapping("/item")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity addToItem(@RequestHeader("token") String token,
                                    @RequestParam Integer productId,
                                    @RequestParam Integer number,
                                    @RequestParam Integer productPropsId){
        //因为已经通过了权限，所以此处不会抛出异常
        Integer userId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        Item item = new Item();
        item.setProductId(productId);
        item.setProductPropsId(productPropsId);
        item.setQuantity(number);
        item.setUserId(userId);
        Item item1 = ecomService.putToItem(item);
        return ControllerUtil.getDataResult(item1);
    }
    //增加或者减少购物车里面的内容，需要判断，如果item的数量为0，直接删除
    @PostMapping("item/{id}")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity changeItemNumber(@PathVariable Integer id,
                                           @RequestParam Boolean up,
                                           @RequestHeader("tokem") String token){
        Integer userId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        boolean rs = ecomService.changeNumberOfItem(userId,id,up);
        return ControllerUtil.getTrueOrFalseResult(rs);
    }
    //order相关

    //生成订单，用户参数，以及订单折扣参数等，多重(多次)校验数据
    @PutMapping("/order")
    @Authentication(role = AuthAopConstant.USER)
    public ResponseEntity makeOrder(@RequestHeader("token") String token,
                                        @RequestParam Integer decouponId,
                                        @RequestParam Boolean useCredit,
                                        @RequestParam Integer addrId){
        Integer userId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        Map<String, Object> map;
        map = ecomService.generateOrder(userId,decouponId,useCredit, addrId);
        return ControllerUtil.getDataResult(map);
    }


}
