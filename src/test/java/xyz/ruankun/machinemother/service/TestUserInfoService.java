package xyz.ruankun.machinemother.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.repository.UserRepository;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestUserInfoService {

    private final Double integration = 5.5;

    private final int invitor = 1234567890;
    private final Double award = 10.00;

    @Autowired
    UserInfoService userInfoService;

    @Resource
    UserRepository userRepository;

    @Test
    public void m1(){
        userInfoService.login("06188Iot1NADfe0la8mt1TKPot188Ion");
    }

    @Test
    public void Jason0603(){
        User user = new User();
        user.setOpenId(1234567890);
        user.setName("Rothschild");
        user.setGmtCreate(new Date());
        user.setIntegration(integration);
        user.setInvitorId(invitor);
        user.setAward(integration);
        user.setAvator("/image/Rothschild");
        user.setPhone("12345654321");
        user.setWxId("Rothschild");
        user.setGmtModified(new Date());
        userRepository.save(user);

        /**
         * 输出所有数据
         */
        for (User user1 : userRepository.findAll()){
            System.out.println(user1);
            System.out.println("---------------------------------------------------------------------------");
        }
        /**
         * 模糊查询输出
         */
        for (User user2: userRepository.findByNameLike("%Rothsc%")){
            System.out.println(user2);
            System.out.println("--------------------------------------------------------------------------");
        }
        /**
         * update
         */
        for (User user1:userRepository.findUsersByInvitorId(1)){
            user1.setName("赖俊");
            userRepository.save(user1);
        }

        /**
         * 所有结果按照积分高低倒叙
         */
        for (User user1: userRepository.findByOrderByIntegrationDesc()){
            System.out.println(user1);
        }

        /**
         * 按照名字模糊查询取赏金最高的前三
         */
        List<User> users = userRepository.findTop3ByNameLikeOrderByAwardDesc("%Roth%");
        System.out.println(users.size());
        for(User user1 : users) {
            System.out.println(user1);
        }
    }

}
