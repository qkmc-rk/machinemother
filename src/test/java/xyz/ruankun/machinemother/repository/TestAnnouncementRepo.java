package xyz.ruankun.machinemother.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestAnnouncementRepo {

    @Autowired
    AnnouncementRepository announcementRepository;

    @Test
    public void ma(){
        System.out.println(announcementRepository.findAll().get(0).getGmtCreate());
    }
}
