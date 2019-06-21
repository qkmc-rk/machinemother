package xyz.ruankun.machinemother.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import xyz.ruankun.machinemother.entity.Comment;
import xyz.ruankun.machinemother.service.impl.EcomServiceImpl;

import java.util.Date;

/**
 * @Author Jason
 * @Date 2019/6/11 13:19
 * @Version 1.0
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TestCommentService {

    @Autowired
    CommentService commentService;
    @Autowired
    EcomService ecomService;
    @Test
    public void test1(){
        Comment comment = new Comment();
        commentService.add(comment);
    }
//    @Test
//    public void main(){
//        EcomServiceImpl ecomService = new EcomServiceImpl();
//        System.out.println(ecomService.orderNumberGenerator());
//    }
    @Test
    public void labelTest(){
        label1: {
        System.out.println("hello");
        if (true){
            break label1;
        }
        System.out.println("world");
        }
    }
}
