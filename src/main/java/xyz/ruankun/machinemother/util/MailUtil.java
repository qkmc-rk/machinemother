package xyz.ruankun.machinemother.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class MailUtil {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private SimpleMailMessage templateMailMessage;//配置的模板,用此模板new一个需要使用的具体message对象,发送给用户邮箱

    public void doSendDataBase(String usermail, String attachmentPath){


    }


}
