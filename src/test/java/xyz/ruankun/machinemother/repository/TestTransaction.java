package xyz.ruankun.machinemother.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Item;
import xyz.ruankun.machinemother.entity.Order;
import xyz.ruankun.machinemother.entity.PublicDecoupon;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.util.MD5Util;
import xyz.ruankun.machinemother.util.QiNiuFileUtil;

import javax.annotation.Resource;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestTransaction {

    @Resource
    private UserRepository userRepository;

    @Resource
    private OrderRepository orderRepository;

    @Resource
    private OrderSecretRepository orderSecretRepository;

    @Resource
    private ItemRepository itemRepository;

    @Resource
    private PublicDecouponRepository publicDecouponRepository;

    @Test
    public void ad() {
        //all();
    }


    @Transactional(propagation = Propagation.REQUIRED)
    public User addUser() {
        User user = new User();
        user.setGmtModified(new Date());
        user.setGmtCreate(new Date());
        user.setAward(10.80);
        user.setAvator("Jason`s avator");
        user.setWxId("Jason");
        user.setInvitorId(0);
        user.setIntegration(103);
        user.setName("Jason");
        user.setPhone("234567897654");
        user.setOpenId("JasonJason");
        userRepository.save(user);
//        throw new RuntimeException("this is user exception");
        return user;
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void order() {
        Item item = new Item();
        item.setQuantity(1);
        item.setUserId(2);
        item.setProductPropsId(2);
        item.setGmtModified(new Date());
        item.setProductId(1);
        item.setGmtCreate(new Date());
        itemRepository.save(item);

        Order order = new Order();
        order.setGmtCreate(new Date());
        order.setAmount(new BigDecimal("2323.22"));
        order.setIsPaid(false);
        order.setIsFinished(false);
        order.setUseCredit(false);
        order.setUseDecoupon(false);
        order.setGmtModified(new Date());
        order.setOrderNumber("1111");
        order.setUserId(2);
        order.setCredit(new BigDecimal(0));
        order.setDecouponId(2);

        orderRepository.save(order);

    }

    @Test
    public void all() {
        Set<PublicDecoupon > publicDecoupons = publicDecouponRepository.findDecoupon(27);
        System.out.println(publicDecoupons);
    }

    /**
     * 测试一哈上传头像到七牛云保存到数据库的接口
     */
    @Test
    public void ttt(){
        System.out.println("哈哈哈哈！");
        InputStream inputStream = QiNiuFileUtil.downloadFile("https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eribnVtm379TFU0wmDJNbROyMXYZhjR2qXvC2vvm4tH9wXXGsHAicVGoyHDPO0ibTD71fP72J4Zwj5EQ/132");
        System.out.println(QiNiuFileUtil.uploadToQiNiu(inputStream, MD5Util.md5(new Date().toString())));

    }
}
