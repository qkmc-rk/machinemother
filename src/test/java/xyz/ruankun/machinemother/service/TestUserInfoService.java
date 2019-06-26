package xyz.ruankun.machinemother.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.junit4.SpringRunner;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.repository.UserRepository;

import javax.annotation.Resource;
import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestUserInfoService {

    private final Integer integration = 5;

    private final int invitor = 1234567890;
    private final Double award = 10.00;

    @Autowired
    UserInfoService userInfoService;

    @Resource
    UserRepository userRepository;

    @Test
    public void m1() {
        userInfoService.login("06188Iot1NADfe0la8mt1TKPot188Ion");
    }

    @Test
    public void Jason0603() {
        User user = new User();
        user.setOpenId("1234567890");
        user.setName("Rothschild");
        user.setGmtCreate(new Date());
        user.setIntegration(integration);
        user.setInvitorId(invitor);
        user.setAward(6.0);
        user.setAvator("/image/Rothschild");
        user.setPhone("12345654321");
        user.setWxId("Rothschild");
        user.setGmtModified(new Date());
        userRepository.save(user);

        PageRequest pageable = PageRequest.of(10, 4, Sort.Direction.DESC, "id");
        /**
         * 输出所有数据
         */
        for (User user1 : userRepository.findAll(pageable)) {
            System.out.println(user1);
            System.out.println("---------------------------------------------------------------------------");
        }

        Page<User> users = userRepository.findByNameLike("%R%", pageable);
        System.out.println(users.getTotalElements());
        System.out.println(users.getTotalPages());
        System.out.println(users.getNumber());
        System.out.println(users.getSize());
        for (User user1 : users) {

            System.out.println(user1 + "================== ");
        }
        System.out.println(users);

    }

}
