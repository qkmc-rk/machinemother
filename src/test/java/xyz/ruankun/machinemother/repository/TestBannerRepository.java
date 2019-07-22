package xyz.ruankun.machinemother.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigDecimal;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestBannerRepository {

    @Autowired
    BannerRepository bannerRepository;

    @Test
    public void m1() {
        System.out.println(bannerRepository.findAllByIsVisibleTrue());
    }

    @Test
    public void m2() {
        System.out.println(0.06 + 0.01);
        System.out.println(1.0 - 0.42);
        System.out.println(4.015 * 100);
        System.out.println(303.1 / 1000);
        System.out.println("-------------------------------------");
        BigDecimal bigDecimal = new BigDecimal(0.06);
        BigDecimal bigDecimal1 = new BigDecimal(0.01);
        System.out.println(bigDecimal.add(bigDecimal1));
        BigDecimal bigDecimal2 = new BigDecimal(1.0);
        BigDecimal bigDecimal3 = new BigDecimal(0.42);
        System.out.println(bigDecimal2.subtract(bigDecimal3));
        BigDecimal bigDecimal4 = new BigDecimal(4.015);
        BigDecimal bigDecimal5 = new BigDecimal(100);
        System.out.println(bigDecimal4.multiply(bigDecimal5));
        BigDecimal bigDecimal6 = new BigDecimal(303.1);
        BigDecimal bigDecimal7 = new BigDecimal(1000);
        System.out.println(bigDecimal6.divide(bigDecimal7));
        System.out.println("------------------------------");

        BigDecimal bigDecimal8 = new BigDecimal(String.valueOf(0.06));
        BigDecimal bigDecimal9 = new BigDecimal(String.valueOf(0.01));
        System.out.println(bigDecimal9.add(bigDecimal8));
        BigDecimal bigDecimal10 = new BigDecimal(String.valueOf(1.0));
        BigDecimal bigDecimal11 = new BigDecimal(String.valueOf(0.42));
        System.out.println(bigDecimal10.subtract(bigDecimal11));
        BigDecimal bigDecimal12 = new BigDecimal(String.valueOf(4.015));
        BigDecimal bigDecimal13 = new BigDecimal(String.valueOf(100));
        System.out.println(bigDecimal12.multiply(bigDecimal13).doubleValue());
        BigDecimal bigDecimal14 = new BigDecimal(String.valueOf(303.1));
        BigDecimal bigDecimal15 = new BigDecimal(String.valueOf(1000));
        System.out.println(bigDecimal14.divide(bigDecimal15));
    }

    @Test
    public void dssa(){
        String mes = "sd:sd:dsa:dsfa:";
        System.out.println(mes.split(":").length);
//        for (String str :mes.split(":")){
//            System.out.println(str);
//        }
    }

}
