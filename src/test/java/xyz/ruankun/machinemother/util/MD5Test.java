package xyz.ruankun.machinemother.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MD5Test {

    @Test
    public void m1(){
        System.out.println("密码是： + " + MD5Util.md5("admin"));//盐 ：machinemother
    }

    @Test
    public void m2(){
        System.out.println(MD5Util.md5("Jason"));
    }

}
