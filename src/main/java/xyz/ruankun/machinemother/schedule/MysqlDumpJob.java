package xyz.ruankun.machinemother.schedule;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

@Component
@EnableScheduling
public class MysqlDumpJob {

    @Value("${spring.mail.username}")
    private static String from;
    @Value("${spring.mail.receiver}")
    private static String usermail;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private SimpleMailMessage templateMailMessage;//配置的模板,用此模板new一个需要使用的具体message对象,发送给用户邮箱


    private Logger logger = LoggerFactory.getLogger(MysqlDumpJob.class);

    @Scheduled(cron = "0 0/1 * * * ?")
    public void mysqlDump(){
        logger.info("开始备份数据库");
        String shellPath = "/root/mysqldump.sh";
        try {
            Process process = Runtime.getRuntime().exec(shellPath);

            process.waitFor();

            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
            StringBuffer sb = new StringBuffer();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
            String result = sb.toString();
            //获得结果再说
            System.out.println(result);
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            logger.error("执行命令时发生了未知异常，请参照异常 ↓");
            logger.error(e.getMessage());
        }
        logger.info("备份数据库完成");
        //备份完成后进行邮件发送
        //doSendDataBase("");

    }

    public void doSendDataBase(String attachmentPath){
        //定义邮件发送器
        JavaMailSenderImpl sender = (JavaMailSenderImpl) mailSender;
        //定义mime message
        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper helper;

        try {
            File file = new File(attachmentPath);
            helper = new MimeMessageHelper(message, true);
            //设置内容
            helper.addAttachment("mysqlDump",file);
            helper.setSubject("数据库备份通知");
            helper.setTo(usermail);
            helper.setFrom(from);

            helper.setText("<html>\r\n" +
                    "	<body>\r\n" +
                    "		<div style=\"width: 300px; margin: auto;\">\r\n" +
                    "           <h1>数据库备份!</h1>" +
                    "		</div>\r\n" +
                    "	</body>\r\n" +
                    "</html>", true);
            sender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }


}
