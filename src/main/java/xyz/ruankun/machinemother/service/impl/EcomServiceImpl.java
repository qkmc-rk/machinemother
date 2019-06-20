package xyz.ruankun.machinemother.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.annotation.小坏蛋;
import xyz.ruankun.machinemother.entity.Item;
import xyz.ruankun.machinemother.repository.ItemRepository;
import xyz.ruankun.machinemother.service.EcomService;
import xyz.ruankun.machinemother.util.WePayUtil;

import java.util.Map;
import java.util.Random;

@Service
public class EcomServiceImpl implements EcomService {

    @Autowired
    ItemRepository itemRepository;

    @Override
    public Item putToItem(Item item) {
        try {
            return itemRepository.save(item);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //增加或者减少item的数量
    @Override
    public boolean changeNumberOfItem(Integer userId, Integer id, Boolean up) {
        Item item = null;
        try {
            item = itemRepository.findById(id).get();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        if (item.getUserId().intValue() != userId.intValue()){
            //不是该用户的item
            return false;
        }
        if (up){
            //增加1
            item.setQuantity(item.getQuantity().intValue() + 1);
        }else{
            //减少1，还要判断是否为0
            if (item.getQuantity().intValue() == 0)
                return false;
            else{
                //可以减少1，但是减少后还要判断是否为0 为0则删除，不为零不管
                if (item.getQuantity() == 1){
                    //直接删除
                    try {
                        itemRepository.delete(item);
                        return true;
                    } catch (Exception e) {
                        e.printStackTrace();
                        return false;
                    }
                }else{
                    //直接减少1
                    item.setQuantity(item.getQuantity().intValue() - 1);
                }
            }
        }
        if (null != itemRepository.saveAndFlush(item)) return true;
            return false;
    }

    @Override
    public Map<String, Object> generateOrder(Integer userId, Integer decouponId, Boolean useCredit, Integer addrId) {
        //new 一个order对象，并设置不需要传值的相关区域
        //生成订单号然后注入
        //找出所有item（该userid的item，并且item是没有订单号的）,算出钱的数字
        //
        return null;
    }

    //生成订单号返回，纯数字
    @小坏蛋
    private  String orderNumberGenerator(){
        String template = "1234567890";
        Random random = new Random();
        StringBuilder orderNumber = new StringBuilder("9");
        for (int i = 0; i < 31; i++){
            orderNumber.append(template.charAt(random.nextInt(10)));
        }
        return orderNumber.toString();
    }
}
