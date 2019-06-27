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
		String str = MD5Util.md5("Jason");
		System.out.println(str);
		if(str .equals("472D46CB829018F9DBD65FB8479A49BB")){
			System.out.println("equal");
		}else{
			System.out.println("not equal");
		}
	}

}
