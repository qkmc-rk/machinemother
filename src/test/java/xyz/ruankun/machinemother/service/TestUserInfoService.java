package xyz.ruankun.machinemother.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Order;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.repository.OrderRepository;
import xyz.ruankun.machinemother.repository.UserRepository;
import xyz.ruankun.machinemother.util.MD5Util;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

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
    @Resource
    OrderRepository orderRepository;

    @Test
    public void m1() {
        userInfoService.login("06188Iot1NADfe0la8mt1TKPot188Ion");
    }

    @Test
    public void Jason0603() {
        Order order = orderRepository.findById(5126);
        System.out.println(order);
    }

    @Test
    public void s() {
//        List<User> users = userRepository.findByInvitorId(7);
        Integer userId = null;
        User users = userRepository.findByOpenId("1234567890");
//        User users = userRepository.findOne(2);
        if (users == null) {
            System.out.println("null");
        } else {
            System.out.println(users);
        }
    }

    @Test
//    @Transactional(rollbackFor = Exception.class)
    public void de() {
//        try {
//            userRepository.deleteByOpenId("1234567890");
//        }catch (Exception e){
//            e.printStackTrace();
//        }
        User user1 = new User();
        System.out.println(user1.getId());
    }


    @Test
    public void deee(){
        MD5Util.trueMd5(27+"limo"+0.22);
    }
}
