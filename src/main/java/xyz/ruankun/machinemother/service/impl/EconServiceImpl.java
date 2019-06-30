package xyz.ruankun.machinemother.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.*;
import xyz.ruankun.machinemother.repository.*;
import xyz.ruankun.machinemother.service.EconService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.DataCode;
import xyz.ruankun.machinemother.util.MD5Util;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class EconServiceImpl implements EconService {

    @Resource
    private OrderRepository orderRepository;

    @Resource
    private ItemRepository itemRepository;

    @Resource
    private OrderSecretRepository orderSecretRepository;

    @Resource
    private DecouponRepository decouponRepository;

    @Resource
    private CreditRecordRepository creditRecordRepository;

    @Resource
    private ProductPropsRepository productPropsRepository;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Order addOrder(int userId, int decouponId, Boolean useCredit, Integer credit, Integer addrId) {
        Order order = new Order();
        BigDecimal youhui = new BigDecimal(0);     //优惠额度
        //如果使用优惠券且优惠券存在
        if (decouponId > 0) {
            Decoupon decoupon = decouponRepository.getOne(decouponId);
            if (decoupon != null && !decoupon.getPast() && !decoupon.getUsed()) {
                //将优惠券标记为使用状态
                decoupon.setUsed(true);
                youhui = decoupon.getWorth();
                decouponRepository.save(decoupon);//若是最终order未完成，则需将优惠券状态重新置回。若当时已过期则另行判断

                //设置order中与decoupon相关的属性
                order.setDecouponId(decouponId);
                order.setUseDecoupon(true);
                order.setCredit(new BigDecimal(0));
                order.setUseCredit(false);

            } else {
                //decoupon状态异常则返回null;
                return null;
            }
            //todo 是否可以同时使用积分和优惠券的问题
        } else if (useCredit) {
            CreditRecord creditRecord = new CreditRecord();
            creditRecord.setAmount(credit);
            creditRecord.setGmtCreate(new Date());
            creditRecord.setSave(false);        //带完成order后修改为true；
            creditRecord.setUserId(userId);
            creditRecordRepository.save(creditRecord);
            youhui = new BigDecimal(creditRecord.getAmount() / 100);

            //设置order与credit相关属性
            order.setUseCredit(true);
            order.setCredit(new BigDecimal(credit));
            order.setUseDecoupon(false);
            order.setDecouponId(0);
        }

        //获取items计算总金额
        order.setOrderNumber(generateNumber());

        List<Item> items = getItemsFree(userId);
        BigDecimal amount = new BigDecimal(0);
        for (Item item : items) {
            ProductProps productProps = productPropsRepository.getOne(item.getProductPropsId());
            if (productProps == null) {
                throw new RuntimeException("没有productProps相关信息");
            } else {
                amount.add(productProps.getPrice());
                item.setOrderNumber(order.getOrderNumber());
            }
        }
        order.setAmount(amount.subtract(youhui));
        if (order.getAmount().doubleValue() < 0) {
            order.setAmount(new BigDecimal(0));
        }
        order.setPaid(false);
        order.setFinished(false);
        order.setGmtModified(new Date());
        order.setGmtCreate(new Date());
        order.setAddrId(addrId);
        order.setUserId(userId);
        orderRepository.save(order);
        //设置ordersecret
        OrderSecret orderSecret = new OrderSecret();
        orderSecret.setGmtCreate(new Date());
        orderSecret.setGmtModified(new Date());
        orderSecret.setOrderid(order.getId());
        orderSecret.setUsed(false);
        orderSecret.setUserId(userId);
        orderSecretRepository.save(orderSecret);
        itemRepository.saveAll(items);
        return order;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public Order getOrder(int id) {
        try {
            Order order = orderRepository.findById(id);
            if(order == null){
                order = new Order();
                order.setId(0);
            }
            return order;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public Order getOrder(String orderNumber) {
        try {
            Order order = orderRepository.findByOrderNumber(orderNumber);
            if(order == null){
                order = new Order();
                order.setId(0);
            }
            return order;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public List<Order> getOrders(int userId) {
        return orderRepository.findByUserId(userId);
    }

    @Override
    public Page<Order> getOrders(Pageable pageable) {
        return orderRepository.findAll(pageable);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer deleteOrder(int id) {
        Integer oResult = orderRepository.deleteById(id);
        Integer sResult = orderSecretRepository.deleteByOrderid(id);
        if (oResult <= 0 || sResult <= 0) {
            try {
                throw new Exception("data error");
            } catch (Exception e) {
                e.printStackTrace();
                return DataCode.DATA_OPERATION_FAILURE;
            }
        } else {
            return DataCode.DATA_OPERATION_SUCCESS;
        }
    }

    @Override
    @Transactional
    public Boolean deleteOrders(int userId) {
        Integer result = orderRepository.deleteByUserId(userId);
        Integer re = orderSecretRepository.deleteByUserId(userId);
        if (result <= 0 || re <= 0) {
            try {
                throw new Exception("data error");
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        } else {
            return true;
        }
    }

    @Override
    public Item getItem(int id) {
        try {
            Item item = itemRepository.findById(id);
            if(item == null){
                item = new Item();
                item.setId(0);
            }
            return item;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public Item getItem(int userId, int productId) {
        try {
            Item item = itemRepository.findByUserIdAndProductId(userId, productId);
            if(item == null){
                item = new Item();
                item .setId(0);
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Item> getItems(int userId) {
        return itemRepository.findByUserId(userId);
    }

    @Override
    public Boolean addItem(Item item) {
        try {
            itemRepository.save(item);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean updateItem(Item item) {
        if (getItem(item.getId()) == null) {
            return false;
        } else {
            try {
                itemRepository.save(item);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
    }

    @Override
    @Transactional
    public Integer deleteItem(int id) {
        Integer result = itemRepository.deleteById(id);
        if (result <= 0) {
            return DataCode.DATA_OPERATION_FAILURE;
        } else {
            return DataCode.DATA_OPERATION_SUCCESS;
        }
    }

    @Override
    public Boolean deleteItems(int userId) {
        Integer result = itemRepository.deleteByUserId(userId);
        if (result <= 0) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public OrderSecret getSecretById(int id) {
        try {
            OrderSecret orderSecret = orderSecretRepository.getOne(id);
            if(orderSecret == null){
                orderSecret = new OrderSecret();
                orderSecret.setId(0);
            }
            return orderSecret;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public OrderSecret getSecretByOrder(int orderId) {
        try {
            OrderSecret orderSecret = orderSecretRepository.findByOrderid(orderId);
            if(orderSecret == null){
                orderSecret = new OrderSecret();
                orderSecret.setId(0);
            }
            return orderSecret;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 这是一个事务级的操作
     *
     * @param orderSecret
     * @param orderId
     * @return
     */
    @Override
    @Transactional
    public Boolean confirmOrder(String orderSecret, Integer orderId) {

        OrderSecret orderSecret1 = null;
        try {
            orderSecret1 = getSecretByOrder(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        if (orderSecret1.getSecret().equals(orderSecret)) {
            orderSecret1.setUsed(true);
            Order order = null;
            try {
                order = orderRepository.findById(orderId).get();
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            order.setFinished(true);//完成订单
            //事务操作
            orderRepository.saveAndFlush(order);
            orderSecretRepository.saveAndFlush(orderSecret1);
            return true;
        } else
            return false;
    }

    @Override
    public List<Item> getItemsUsed(int userId, String orderNumber) {
        return itemRepository.findByUserIdAndOrderNumber(userId, orderNumber);
    }

    @Override
    public List<Item> getItemsFree(int userId) {
        return itemRepository.findByUserIdAndOrderNumberIsNull(userId);
    }
//    private void add(User user){
//        userInfoService.save(user);
//        throw new RuntimeException("sdfadaf");
//    }

//    private void additem(Item item){
//        itemRepository.save(item);
//        throw new RuntimeException("item");
//    }

//    private void addOer(Order order){
//        orderRepository.save(order);
//        throw new RuntimeException("order");
//    }

    private String generateNumber() {
        long time = new Date().getTime();   //当前时间作为加密种子
        return MD5Util.md5(String.valueOf(time));
    }
}
