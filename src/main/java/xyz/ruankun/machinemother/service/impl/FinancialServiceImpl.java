package xyz.ruankun.machinemother.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.*;
import xyz.ruankun.machinemother.repository.*;
import xyz.ruankun.machinemother.service.FinancialService;
import xyz.ruankun.machinemother.util.MD5Util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class FinancialServiceImpl implements FinancialService {

    @Autowired
    CommissionRecordRepository commissionRecordRepository;
    @Autowired
    CreditRecordRepository creditRecordRepository;
    @Autowired
    DecouponRepository decouponRepository;
    @Autowired
    DecouponCDKeyRepository decouponCDKeyRepository;
    @Autowired
    WalletRepository walletRepository;
    @Autowired
    OrderSecretRepository orderSecretRepository;
    @Autowired
    OrderRepository orderRepository;
    @Autowired
    UserRepository userRepository;
    @Override
    public Wallet selectWallet(Integer userId) {
        try {
            return walletRepository.findByUserId(userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<CreditRecord> findAllCreditRecord(Integer userid) {
        try {
            return creditRecordRepository.findAllByUserId(userid);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<CommissionRecord> findAllCommissionRecord(Integer userid) {
        try {
            return commissionRecordRepository.findAllByUserId(userid);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public OrderSecret GetSecretByOrderIdAndUserId(Integer orderid, Integer userid) {
        try {
            return orderSecretRepository.findByUserIdAndOrderid(userid,orderid);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean confirmOrder(Integer orderid,String secret) {
        Order order;
        OrderSecret orderSecret;
        try {
            order = orderRepository.findById(orderid).get();
            orderSecret = orderSecretRepository.findByUserId(order.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        if (orderSecret.getSecret() != null && orderSecret.getSecret().equals(secret)){
            //可以的
            order.setFinished(true);
            try {
                orderRepository.saveAndFlush(order);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }else{
            return false;
        }
        return false;
    }

    @Override
    public List<Decoupon> findAllDecouponByUserId(Integer userid) {
        try {
            return decouponRepository.findAllByUserId(userid);
        } catch (Exception e) {
            e.printStackTrace();
            return  null;
        }
    }

    @Override
    public Decoupon convertDecoupon(Integer userid, String decouponKey) {
        DecouponCDKey decouponCDKey;
        //key是否存在或者过期
        try {
            decouponCDKey = decouponCDKeyRepository.findByCdkey(decouponKey);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        //是否使用过
        if (decouponCDKey.getExchanged())return null;
        //是否过期
        if (decouponCDKey.getGmtPast().getTime() < new Date().getTime()){
            //过期了，不能再兑换了
            decouponCDKey.setPast(true);
            decouponCDKeyRepository.saveAndFlush(decouponCDKey);
            return null;
        }
        //未过期
        decouponCDKey.setExchanged(true);
        Decoupon decoupon = getDecouponWithDecouponCDKey(decouponCDKey,userid);
        //同时保存到数据库
        try {
            decouponCDKeyRepository.saveAndFlush(decouponCDKey);
            return decouponRepository.save(decoupon);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<DecouponCDKey> generateDecouponCDKey(Integer totalNum, Decoupon decoupon) {
        List<DecouponCDKey> decouponCDKeys = new ArrayList<>();
        DecouponCDKey decouponCDKey;
        do{
            decouponCDKeys.add(getDecouponCDKeyWithDecoupon(decoupon));

        }while(--totalNum > 0);
        //存数据库
        try {
            return decouponCDKeyRepository.saveAll(decouponCDKeys);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<DecouponCDKey> findAllCdKey() {

        try {
            return decouponCDKeyRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Decoupon giveDecouponToUser(Integer userid, Decoupon decoupon) {
        try {
            Decoupon decoupon1 = decouponCopy(decoupon,userid);
            return decouponRepository.save(decoupon1);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Decoupon> giveDecouponToAllUser(Decoupon decoupon) {
        //先拿到所有用户的id
        List<User> users = userRepository.findAll();
        List<Decoupon> decoupons = new ArrayList<>();
        Decoupon decoupon1;
        for (User u:
             users) {
            //每个用户都生成一个Decoupon
            decoupon1 = decouponCopy(decoupon,u.getId());
            decoupons.add(decoupon1);
            //清空
            decoupon1 = null;
        }
        try {
            return decouponRepository.saveAll(decoupons);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 用于把复制对象
     * 这是一种低效率的方法，
     * 可以使用cglib的属性复制器
     * @param decouponCDKey
     */
    private Decoupon getDecouponWithDecouponCDKey(DecouponCDKey decouponCDKey,Integer userid){
        Decoupon decoupon = new Decoupon();
        decoupon.setFromexchange(true);
        decoupon.setMin(decouponCDKey.getMin());
        decoupon.setPast(decouponCDKey.isPast());
        decoupon.setUsed(false);
        decoupon.setUserid(userid);
        decoupon.setWorth(decouponCDKey.getWorth());
        return decoupon;
    }
    private DecouponCDKey getDecouponCDKeyWithDecoupon(Decoupon decoupon){
        DecouponCDKey decouponCDKey = new DecouponCDKey();
        decouponCDKey.setCdkey(MD5Util.md5(MD5Util.randStr()));
        decouponCDKey.setExchanged(false);
        decouponCDKey.setGmtCreate(new Date());
        decouponCDKey.setWorth(decoupon.getWorth());
        decouponCDKey.setMin(decoupon.getMin());
        decouponCDKey.setPast(false);
        decouponCDKey.setGmtPast(decoupon.getGmtPast());
        return decouponCDKey;
    }

    private Decoupon decouponCopy(Decoupon decoupon,Integer userid){
        Decoupon decoupon1 = new Decoupon();
        decoupon1.setWorth(decoupon.getWorth());
        decoupon1.setUserid(userid);
        decoupon1.setUsed(false);
        decoupon1.setPast(false);
        decoupon1.setMin(decoupon.getMin());
        //这个是管理员发的，不算是兑换的，所以不是兑换而来
        decoupon1.setFromexchange(false);
        decoupon1.setGmtCreate(new Date());
        decoupon1.setGmtPast(decoupon.getGmtPast());
        return decoupon1;
    }
}
