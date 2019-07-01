package xyz.ruankun.machinemother.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.annotation.小坏蛋;
import xyz.ruankun.machinemother.entity.*;
import xyz.ruankun.machinemother.repository.*;
import xyz.ruankun.machinemother.service.EcomService;
import xyz.ruankun.machinemother.util.Constant;

import java.math.BigDecimal;
import java.util.*;

@Service
public class EcomServiceImpl implements EcomService {

    @Autowired
    ItemRepository itemRepository;
    @Autowired
    AddrRepository addrRepository;
    @Autowired
    ProductPropsRepository productPropsRepository;
    @Autowired
    WalletRepository walletRepository;
    @Autowired
    DecouponRepository decouponRepository;
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    CreditRecordRepository creditRecordRepository;

    @Override
    public List<Item> getItems(Integer userId) {
        return itemRepository.findByUserIdAndOrderNumberIsNull(userId);
    }

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
            item = itemRepository.findById(id.intValue());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        if (item.getUserId().intValue() != userId.intValue()) {
            //不是该用户的item
            return false;
        }
        if (up) {
            //增加1
            item.setQuantity(item.getQuantity().intValue() + 1);
        } else {
            //减少1，还要判断是否为0
            if (item.getQuantity().intValue() == 0)
                return false;
            else {
                //可以减少1，但是减少后还要判断是否为0 为0则删除，不为零不管
                if (item.getQuantity() == 1) {
                    //直接删除
                    try {
                        itemRepository.delete(item);
                        return true;
                    } catch (Exception e) {
                        e.printStackTrace();
                        return false;
                    }
                } else {
                    //直接减少1
                    item.setQuantity(item.getQuantity().intValue() - 1);
                }
            }
        }
        if (null != itemRepository.saveAndFlush(item)) return true;
        return false;
    }

    /**
     * 订单生成
     *
     * @param userId
     * @param decouponId
     * @param useCredit
     * @param addrId
     * @return
     */
    @Override
    @Transactional
    public Map<String, Object> generateOrder(Integer userId, Integer decouponId, Boolean useCredit, Integer addrId) {
        Map map = new HashMap();
        List<Item> items = null;
        BigDecimal amount = new BigDecimal(0);
        Integer amountFen = 0;
        CreditRecord creditRecord = null;
        Decoupon decoupon = null;
        //new 一个order对象，并设置不需要传值的相关区域
        Order order = new Order();
        order.setPaid(false);
        order.setFinished(false);
        /*********这部分内容填写了可能被覆盖，但是为了最后不为null，必须填写*******/
        order.setDecouponId(0);
        order.setUseCredit(false);
        order.setCredit(new BigDecimal(0));
        order.setUseDecoupon(false);
        /*****************/
        //将addrId写入order，userId写入order
        order.setUserId(userId);
        Addr addr = null;
        try {
            addr = addrRepository.findById(addrId.intValue());
            if (addr.getUserId().intValue() != userId.intValue()) {
                map.put("error", "改收货地址与用户不匹配");
                return map;
            }
        } catch (Exception e) {
            e.printStackTrace();
            map.put("error", "没有找到收货地址");
            return map;

        }
        order.setAddrId(addrId);
        //生成订单号然后注入
        order.setOrderNumber(orderNumberGenerator());
        //找出所有item（该userid的item，并且item是没有订单号的）
        items = itemRepository.findByUserId(userId);
        //将ordernumber不为空的排除
        List<Item> items1 = new ArrayList<>();
        for (Item item:
                items) {
            if (item.getOrderNumber() == null)
                items1.add(item);
        }
        items = items1;//交换一下
        //将所有item的orderId设置为xx，（再次声明，orderId不是order的Id，是orderNumber，小失误，小失误）
        //算出订单没有减免前的总金额，转换成分
        if(items.isEmpty()){
            map.put("error","购物车为空");
            return map;
        }
        for (Item i :
                items) {
            i.setOrderNumber(order.getOrderNumber());
            BigDecimal b = productPropsRepository.findById(i.getProductPropsId().intValue()).getPrice();
            amount = amount.add(b);
            System.out.println("I am jisuan amount,item price is :" + b.floatValue() + ",amount is：" + amount);
        }
        amountFen = (int) (amount.floatValue() * 100);

        label1:
        {
            if (useCredit) {
                //若使用积分，则扣除钱包积分，增加积分消费记录，然后减少订单金额
                Wallet wallet = walletRepository.findByUserId(userId);
                //添加优惠券数量
                wallet.setCount(decouponRepository.countByUserIdAndAndIsPastAndAndIsUsed(wallet.getUserId(), false, false));
                Integer credit = wallet.getCredit();
                if (credit == null || credit.intValue() == 0)
                    break label1;
                //减少一定金钱
                amountFen -= credit;
                wallet.setCredit(0);
                creditRecord = new CreditRecord();
                creditRecord.setAmount(credit);
                creditRecord.setSave(false);
                creditRecord.setUserId(userId);
                //设置order
                order.setCredit(new BigDecimal(credit));
                order.setUseCredit(true);
            }
        }
        if (decouponId != null && decouponId /* <= */ > 0) {
            //若使用优惠券，则把优惠券变成已使用，且减少订单金额。
            decoupon = decouponRepository.findById(decouponId.intValue());
            if (decoupon.getPast()) {
                //过期优惠券不能使用
                map.put("error", "过期优惠券无法使用");
            }
            if (decoupon.getGmtPast().getTime() < new Date().getTime()) {
                //优惠券过期了
                map.put("error", "过期优惠券无法使用");
                decoupon.setPast(true);
                decouponRepository.saveAndFlush(decoupon);
                return map;
            }
            if (decoupon.getUserid().intValue() != userId.intValue()) {
                map.put("error", "优惠券不是用户的优惠券");
                return map;
            }
            if (decoupon.getMin().compareTo(amount) > 0) {
                //使用优惠券条件不足
                map.put("error", "使用优惠券条件不足");
                return map;
            }
            amountFen -= (decoupon.getWorth().intValue() * 100);
            decoupon.setUsed(true);
            order.setUseDecoupon(true);
            order.setDecouponId(decouponId);
            if (amountFen.intValue() < 0)
                amountFen = 1;//最低支付1分钱，防止金额变为负数

        }
        order.setAmount(new BigDecimal((float) amountFen / 100));
        System.out.println("订单金额 + ：" + (float) amountFen / 100);
        //order还有一些参数需要设置
        order.setGmtCreate(new Date());
        order.setGmtModified(new Date());
        System.out.println("moximoxi + :" + order.toString());
        //事务：保存order，保存item。（还有前面的增加消费记录，优惠券状态改变）
        try {
            order = orderRepository.save(order);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("error","保存order出现问题。");
            return map;
        }
        try {
            items = itemRepository.saveAll(items);//会覆盖吗
        } catch (Exception e) {
            e.printStackTrace();
            map.put("error","重新设置item时出现错误");
            orderRepository.deleteById(order.getId());//需要回滚
            return map;
        }
        if (creditRecord != null)
            creditRecord.setGmtCreate(new Date());
            creditRecordRepository.save(creditRecord);
        if (decoupon != null)
            decoupon.setGmtCreate(new Date());
            decouponRepository.saveAndFlush(decoupon);
        map.put("status", Constant.SUCCESS_CODE);
        map.put("msg", "订单创建成功");
        return map;
    }
    //订单完成时有很多事情要做

    //生成订单号返回，纯数字
    @小坏蛋(真的吗 = true)
    private String orderNumberGenerator() {
        String template = "1234567890";
        Random random = new Random();
        StringBuilder orderNumber = new StringBuilder("9");
        for (int i = 0; i < 31; i++) {
            orderNumber.append(template.charAt(random.nextInt(10)));
        }
        return orderNumber.toString();
    }
}
