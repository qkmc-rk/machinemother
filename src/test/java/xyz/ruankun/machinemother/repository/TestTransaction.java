package xyz.ruankun.machinemother.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.omg.CORBA.ORB;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.sql.SQLOutput;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestTransaction {

    @Resource
    private UserRepository userRepository;

    @Resource
    private OrderRepository orderRepository;

    @Resource
    private YxRepository yxRepository;

    @Resource
    private OrderSecretRepository orderSecretRepository;

    @Resource
    private ProductRepository productRepository;

    @Resource
    private ItemRepository itemRepository;

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
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = RuntimeException.class)
    public void singleton() {
        List<Product> products = productRepository.findAll();
        for (Product product: products){
            Yingxiao data = new Yingxiao();
            data.setCount(100);
            data.setProductId(product.getId());
            try {
                yxRepository.save(data);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
