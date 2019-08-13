package xyz.ruankun.machinemother.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestQrcodeService {

    @Autowired
    QrCodeService qrCodeService;

    @Test
    public void m1(){
        System.out.println("哈哈:" + qrCodeService.getAccessToken());
        //System.out.println("哈哈2:" + qrCodeService.getQrCodeUrl(2));
    }
}
