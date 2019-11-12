package xyz.ruankun.machinemother.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import xyz.ruankun.machinemother.entity.WithDraw;

import java.math.BigDecimal;
import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class FinacialTest {

    @Autowired
    FinancialService financialService;

    @Test
    public void testDotransfer(){
//
//        WithDraw withDraw = new WithDraw();
//        withDraw.setAmount(new BigDecimal(1));
//        withDraw.setConfirm(false);
//        withDraw.setFailed(false);
//        withDraw.setGmtCreate(new Date());
//        withDraw.setGmtModified(new Date());
//        withDraw.setId(1);
//        withDraw.setUserid(65);
//        withDraw.setOrdernum("91388184967022128079195655650725");
//
//        if (financialService.sendMoneyToWechatUser(withDraw))
//            System.out.println("打钱成功了");
//        else
//            System.out.println("打钱失败了");
//        String s = "ss[xx]234567654321236765[fgcscs]";
//        System.out.println(s.substring(s.indexOf("ss[xx]") + "ss[xx]".length(), s.indexOf("[fgcscs]")));
    }
}
