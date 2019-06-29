package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.Item;

import java.util.List;
import java.util.Map;

public interface EcomService {

    List<Item> getItems(Integer userId);

    Item putToItem(Item item);

    boolean changeNumberOfItem(Integer userId, Integer id, Boolean up);

    /**
     * 这是一个复杂的方法，生成订单要考虑很多因素。
     * @param userId
     * @param decouponId
     * @param useCredit
     * @return
     */
    Map<String, Object> generateOrder(Integer userId, Integer decouponId, Boolean useCredit, Integer addrId);
}
