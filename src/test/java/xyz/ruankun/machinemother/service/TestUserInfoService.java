package xyz.ruankun.machinemother.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import xyz.ruankun.machinemother.service.impl.UserInfoServiceImpl;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestUserInfoService {

    @Autowired
    UserInfoService userInfoService;

    @Test
    public void m1(){
        userInfoService.login("06188Iot1NADfe0la8mt1TKPot188Ion");
    }
}
