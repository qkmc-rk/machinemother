package xyz.ruankun.machinemother;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import xyz.ruankun.machinemother.util.MD5Util;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MachinemotherApplicationTests {

	@Test
	public void contextLoads() {
	}

	@Test
	public void teee(){
		String str = MD5Util.trueMd5(12+"limo"+232.32);
	}

}
