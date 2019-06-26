package xyz.ruankun.machinemother.service.impl;

import io.swagger.models.auth.In;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.*;
import xyz.ruankun.machinemother.repository.*;
import xyz.ruankun.machinemother.service.FinancialService;
import xyz.ruankun.machinemother.util.MD5Util;
import xyz.ruankun.machinemother.util.WePayUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.util.*;

@Service
public class FinancialServiceImpl implements FinancialService {
    private Logger logger = LoggerFactory.getLogger(FinancialServiceImpl.class);

    @Value("${weixin.appid}")
    private String appid;
    //@Value("${weixin.openid}")
    //private String openid;
    @Value("${weixin.mch_id}")
    private String mch_id;
    @Value("${weixin.notify_url}")
    private String notify_url;
    @Value("${weixin.tradetype}")
    private String tradetype;
    @Value("${weixin.signtype}")
    private String signtype;
    @Value("${weixin.key}")
    private String key;
    @Value("${weixin.pay_url}")
    private String url;

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
    @Autowired
    ItemRepository itemRepository;
    @Autowired
    ProductPropsRepository productPropsRepository;
    @Autowired
    ProductRepository productRepository;
    @Resource
    WithDrawRepository withDrawRepository;

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
            return orderSecretRepository.findByUserIdAndOrderid(userid, orderid);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean confirmOrder(Integer orderid, String secret) {
        Order order;
        OrderSecret orderSecret;
        try {
            order = orderRepository.findById(orderid).get();
            orderSecret = orderSecretRepository.findByUserId(order.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        if (orderSecret.getSecret() != null && orderSecret.getSecret().equals(secret)) {
            //可以的
            order.setFinished(true);
            try {
                orderRepository.saveAndFlush(order);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        } else {
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
            return null;
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
        if (decouponCDKey.getExchanged()) return null;
        //是否过期
        if (decouponCDKey.getGmtPast().getTime() < new Date().getTime()) {
            //过期了，不能再兑换了
            decouponCDKey.setPast(true);
            decouponCDKeyRepository.saveAndFlush(decouponCDKey);
            return null;
        }
        //未过期
        decouponCDKey.setExchanged(true);
        Decoupon decoupon = getDecouponWithDecouponCDKey(decouponCDKey, userid);
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
        do {
            decouponCDKeys.add(getDecouponCDKeyWithDecoupon(decoupon));

        } while (--totalNum > 0);
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
            Decoupon decoupon1 = decouponCopy(decoupon, userid);
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
        for (User u :
                users) {
            //每个用户都生成一个Decoupon
            decoupon1 = decouponCopy(decoupon, u.getId());
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

    @Override
    public Map<String, String> getPrepayInfo(Integer orderid, Integer userid, HttpServletRequest request) {
        Map<String, String> rs = new HashMap<>();
        //确认订单是否符合用户
        if (!orderRepository.findById(orderid).isPresent()) {
            //订单没有
            rs.put("error", "错误,没有找到符合的订单");
        }
        Order order = orderRepository.findById(orderid).get();
        if (userid.intValue() != order.getUserId().intValue()) {
            rs.put("error", "错误,订单存在，但不是该用户的订单");
        }
        if (order.getPaid()) {
            rs.put("error", "错误,订单已经支付，无法再次支付");
        }
        //拿到和订单相关的所有信息
        String orderNum = order.getOrderNumber();//订单号
        List<Item> items = itemRepository.findAllByOrderNumber(orderNum);//订单里面的所有物品
        BigDecimal amountYuan = order.getAmount(); //订单总金额
        //通过item拿到订单总金额，且算出金额优惠部分，然后跟之前算的比较，如果数字不一样则出错(这一步没什么用，为了保证数据的安全性)
        List<Integer> ids = new ArrayList<>();
        for (Item i :
                items) {
            ids.add(i.getProductPropsId());
        }
        List<ProductProps> productProps = productPropsRepository.findAllById(ids);
        //未优惠之前的价格
        BigDecimal originAmount = new BigDecimal(0);
        for (ProductProps p :
                productProps) {
            originAmount.add(p.getPrice());
        }
        //拿去优惠券和积分
        BigDecimal credit = order.getCredit();  //积分
        Decoupon decoupon = null;
        if (!decouponRepository.findById(order.getDecouponId()).isPresent()) {
            rs.put("error", "错误,订单所使用的优惠券信息有误，无效订单");
        }
        decoupon = decouponRepository.findById(order.getDecouponId()).get();
        if (originAmount.compareTo(decoupon.getMin()) > 0) {
            rs.put("error", "错误,所使用的优惠券明显不符合要求,订单支付拉起失败");
        }
        BigDecimal decouponAmount = decoupon.getWorth();
        //把所有金额全部转换成分
        Integer originAmountFen = (int) originAmount.floatValue() * 100;
        Integer newOriginAmountFen = (int) (order.getAmount().floatValue() * 100 + credit.floatValue() + decouponAmount.floatValue() * 100);
        if (originAmountFen.intValue() != newOriginAmountFen.intValue()) {
            rs.put("error", "订单金额有误，无法下单！");
        }

        /*-----------------------分割线-------------------------*/
        //开始生成信息去拿去prepay信息
        String nonce_str = WePayUtil.getNonceStr();
        //商品名称
        String body = "机器妈服务-";
        List<Integer> ids2 = new ArrayList<>();
        for (Item i :
                items) {
            ids2.add(i.getProductId());
        }
        List<Product> products = productRepository.findAllById(ids2);
        for (Product p :
                products) {
            body += p.getTitle() + ",";
        }

        //获取客户端的ip地址
        String spbill_create_ip = getIpAddr(request);
        Map<String, String> packageParams = new HashMap<>();
        packageParams.put("appid", appid);
        packageParams.put("mch_id", mch_id);
        packageParams.put("nonce_str", nonce_str);
        packageParams.put("body", body);
        packageParams.put("out_trade_no", orderNum + "");//商户订单号,自己的订单ID
        packageParams.put("total_fee", (int) (amountYuan.floatValue() * 100) + "");//支付金额，这边需要转成字符串类型，否则后面的签名会失败
        packageParams.put("spbill_create_ip", spbill_create_ip);
        packageParams.put("notify_url", notify_url);//支付成功后的回调地址
        packageParams.put("trade_type", tradetype);//支付方式
        User user = null;
        try {
            user = userRepository.findById(userid).get();
        } catch (Exception e) {
            e.printStackTrace();
            //获取用户时出现了问题，无法进行相关交易
            rs.put("error", "获取用户信息时出现了问题，无法完成交易");
        }
        packageParams.put("openid", user.getOpenId() + "");//用户的openID，自己获取

        String prestr = WePayUtil.createLinkString(packageParams);
        String mysign = WePayUtil.sign(prestr, key, "utf-8");

        packageParams.put("sign", mysign);
        String xml = null;
        Map map = null;

        try {
            xml = WePayUtil.mapToXml(packageParams);
        } catch (Exception e) {
            e.printStackTrace();
            rs.put("error", "生成数据时抛出异常");
            return null;
        }
        //调用统一下单地址
        String result = WePayUtil.httpRequest(url, "POST", xml);
        try {
            map = WePayUtil.xmlToMap(result);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        //得到map后，要判断下单是否成功，并封装要返回给前端的数据
        String return_code = (String) map.get("return_code");//返回状态码
        String result_code = (String) map.get("result_code");//返回状态码

        //原来抄过来的代码这里是Map<String, Object>看看改成String会不会报错
        Map<String, String> response = new HashMap<>();//返回给小程序端需要的参数
        if (return_code == "SUCCESS" && return_code.equals(result_code)) {
            String prepay_id = (String) map.get("prepay_id");//返回的预付单信息
            response.put("nonceStr", nonce_str);
            response.put("package", "prepay_id=" + prepay_id);
            Long timeStamp = System.currentTimeMillis() / 1000;
            response.put("timeStamp", timeStamp + "");//这边要将返回的时间戳转化成字符串，不然小程序端调用wx.requestPayment方法会报签名错误
            //拼接签名需要的参数
            String stringSignTemp = "appId=" + appid + "&nonceStr=" + nonce_str + "&package=prepay_id=" + prepay_id + "&signType=MD5&timeStamp=" + timeStamp;
            //再次签名，这个签名用于小程序端调用wx.requesetPayment方法
            String paySign = WePayUtil.sign(stringSignTemp, key, "utf-8").toUpperCase();

            response.put("paySign", paySign);
        }

        response.put("appid", appid);
        return response;
    }

    @Override
    public String orderNotify(HttpServletRequest request) throws Exception {
        logger.info("回调函数开始执行...");
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        br.close();

        //sb为微信返回的xml
        String notityXml = sb.toString();
        logger.info("回调获得的数据：" + notityXml);
        String resXml = "";
        Map map = WePayUtil.xmlToMap(notityXml);
        String returnCode = (String) map.get("return_code");
        if ("SUCCESS".equals(returnCode)) {
            //如果微信发来的sign没有问题就会执行用户的业务逻辑代码
            if (WePayUtil.verifyWeixinNotify(map, key)) {
                //重复回调是什么鬼？暂时不予考虑
                //拿到订单号，然后把对应订单标记为已完成状态。
                String orderNumber = (String) map.get("out_trade_no");

                Order order = null;
                try {
                    order = orderRepository.findByOrderNumber(orderNumber);
                } catch (Exception e) {
                    e.printStackTrace();
                    //通知微信服务器没有该订单，业务出现错误
                    resXml = WePayUtil.NOTIFY_FAIL_SERVER_ERROR;
                    logger.error(resXml);
                }
                if (order != null) order.setPaid(true);
                Order order2 = orderRepository.saveAndFlush(order);
                if (order2 != null && order2.getPaid()) {
                    //通知微信回调业务已经完成成功
                    resXml = WePayUtil.NOTIFY_SUCCESS;
                    logger.error(resXml);
                } else {
                    //通知微信服务器回调遇到错误(保存订单状态时遇到错误)，业务出现错误
                    resXml = WePayUtil.NOTIFY_FAIL_SERVER_ERROR;
                    logger.error(resXml);
                }

            } else {
                resXml = WePayUtil.NOTIFY_FAIL_UNKNOWN_DATA;
                logger.error(resXml);
            }
        } else {
            resXml = WePayUtil.NOTIFY_FAIL_WRONG_RETURN_CODE;
        }
        return resXml;
    }

    @Override
    public WithDraw getWithDraw(Integer id) {
        return withDrawRepository.getOne(id);
    }

    @Override
    public List<WithDraw> getWithDraws(Integer userId) {
        return withDrawRepository.findByUserid(userId);
    }

    @Override
    public List<WithDraw> getWithDraws() {
        return withDrawRepository.findAll();
    }

    /**
     * 提交提现则先扣除wallet中的部分金额
     *
     * @param withDraw
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean addWithDraw(WithDraw withDraw) {
        Wallet wallet = selectWallet(withDraw.getUserid());
        if (wallet == null) {
            return false;
        } else {
            BigDecimal commission = wallet.getCommission().subtract(withDraw.getAmount());
            //若wallet中的余额不足以支持此次提现，则返回失败
            if (commission.doubleValue() < 0) {
                return false;
            } else {
                //满足则将wallet数据减少
                wallet.setCommission(commission);
                wallet.setGmtModified(new Date());
                withDraw.setGmtCreate(new Date());
                try {
                    walletRepository.save(wallet);      //若后续提现失败则需重新添加
                    withDrawRepository.save(withDraw);
                    return true;
                } catch (Exception e) {
                    e.printStackTrace();
                    return false;
                }
            }
        }
    }

    @Override
    public Boolean deleteWithDraw(Integer id) {
        try {
            return withDrawRepository.deleteById(id.intValue());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 若为真则说明提现成功， 反则失败，为wallet添加回相应的提现金额
     *
     * @param id
     * @param option
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateWithDraw(Integer id, Boolean option) {
        WithDraw withDraw = getWithDraw(id);
        if (withDraw == null) {
            return false;
        } else {
            withDraw.setGmtModified(new Date());
            if (option) {
                //确认则创建佣金使用记录，本应与佣金扣除时创建该记录数据，但为设置外键，无法更具提现记录查找佣金记录
                withDraw.setConfirm(true);
                CommissionRecord record = new CommissionRecord();
                record.setAmount(withDraw.getAmount());
                record.setGmtCreate(new Date());
                record.setSave(false);
                record.setUserId(withDraw.getUserid());
                try {
                    commissionRecordRepository.save(record);
                    withDrawRepository.save(withDraw);
                    return true;
                } catch (Exception e) {
                    e.printStackTrace();
                    return false;
                }
            } else {
                //拒绝则不生成佣金使用记录，且归还原先提现请求时扣除的佣金金额
                try {
                    Wallet wallet = selectWallet(withDraw.getUserid());
                    if (wallet == null) {
                        return false;
                    } else {
                        BigDecimal commission = wallet.getCommission().add(withDraw.getAmount());
                        wallet.setCommission(commission);
                        wallet.setGmtModified(new Date());
                        withDraw.setFailed(true);
                        withDrawRepository.save(withDraw);
                        walletRepository.save(wallet);
                        return true;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    return false;
                }
            }
        }
    }

    /**
     * 用于把复制对象
     * 这是一种低效率的方法，
     * 可以使用cglib的属性复制器
     *
     * @param decouponCDKey
     */
    private Decoupon getDecouponWithDecouponCDKey(DecouponCDKey decouponCDKey, Integer userid) {
        Decoupon decoupon = new Decoupon();
        decoupon.setFromexchange(true);
        decoupon.setMin(decouponCDKey.getMin());
        decoupon.setPast(decouponCDKey.isPast());
        decoupon.setUsed(false);
        decoupon.setUserid(userid);
        decoupon.setWorth(decouponCDKey.getWorth());
        return decoupon;
    }

    private DecouponCDKey getDecouponCDKeyWithDecoupon(Decoupon decoupon) {
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

    private Decoupon decouponCopy(Decoupon decoupon, Integer userid) {
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

    //获取IP
    private String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip != null && !ip.equals("") && !"unKnown".equalsIgnoreCase(ip)) {
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if (ip != null && !ip.equals("") && !"unKnown".equalsIgnoreCase(ip)) {
            return ip;
        }
        return request.getRemoteAddr();
    }


}
