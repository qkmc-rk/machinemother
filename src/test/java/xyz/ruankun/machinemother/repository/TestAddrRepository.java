package xyz.ruankun.machinemother.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import xyz.ruankun.machinemother.entity.Addr;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestAddrRepository {

    @Resource
    AddrRepository addrRepository;

    @Test
    public void m1(){
//        List<Addr> addrs = addrRepository.findAllByUserId(1);
//        System.out.println(addrs.get(0).getDetail());
    }
}
