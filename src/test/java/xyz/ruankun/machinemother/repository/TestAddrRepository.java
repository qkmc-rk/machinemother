package xyz.ruankun.machinemother.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import xyz.ruankun.machinemother.entity.Addr;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestAddrRepository {

    @Resource
    AddrRepository addrRepository;

    @Value("${machinemother.vip.level1.ratio}")
    private Integer level3Ratio;

    @Resource
    ItemRepository itemRepository;
    @Test
    public void m1(){
        System.out.println(Integer.valueOf(""));
    }

    @Test
    public void m2(){
        //System.out.println(itemRepository.findByUserId(17));
        System.out.println(new Date().getMonth());
        System.out.println(LocalDate.now().getMonthValue());
        System.out.println(((float)level3Ratio)/100.0);
    }
}
