package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface FinancialService {

    /**
     * 查询用户的钱包信息
     * @param userId
     * @return
     */
    Wallet selectWallet(Integer userId);

    /**
     * 查询用户的积分记录
     * @param userid
     * @return
     */
    List<CreditRecord> findAllCreditRecord(Integer userid);

    /**
     * 查询用户的佣金记录
     * @param userid
     * @return
     */
    List<CommissionRecord> findAllCommissionRecord(Integer userid);


    /**
     * 查询订单的secret
     * @param orderid
     * @param userid
     * @return
     */
    OrderSecret GetSecretByOrderIdAndUserId(Integer orderid, Integer userid);

    boolean confirmOrder(Integer orderid,String secret);

    List<Decoupon> findAllDecouponByUserId(Integer userid);

    /**
     * 兑换优惠券是一个稍微复杂的过程
     * 涉及到两张表的造作
     * @param userid
     * @param decouponKey
     * @return
     */
    Decoupon convertDecoupon(Integer userid, String decouponKey);

    List<DecouponCDKey> generateDecouponCDKey(Integer totalNum,Decoupon decoupon);

    List<DecouponCDKey> findAllCdKey();

    Decoupon giveDecouponToUser(Integer userid, Decoupon decoupon);

    List<Decoupon> giveDecouponToAllUser(Decoupon decoupon);

    Map<String, String> getPrepayInfo(Integer orderid, Integer userid, HttpServletRequest request);
}
