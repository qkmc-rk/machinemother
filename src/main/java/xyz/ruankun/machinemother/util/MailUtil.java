package xyz.ruankun.machinemother.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import xyz.ruankun.machinemother.entity.Order;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Component
public class MailUtil {

    private static Logger logger = LoggerFactory.getLogger(MailUtil.class);

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private SimpleMailMessage templateMailMessage;//配置的模板,用此模板new一个需要使用的具体message对象,发送给用户邮箱


    /**
     * 通知有人下订单并且已经付款
     * @param from
     * @param whoShouldBeNotified
     */
    public boolean doOrderNotify(String from, String whoShouldBeNotified, Order order){
        logger.info("开始执行发送邮件通知订单成功指令");
        logger.info(whoShouldBeNotified + "将被通知");
        //定义邮件发送器
        JavaMailSenderImpl sender = (JavaMailSenderImpl) mailSender;
        //定义mime message
        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper helper;

        try {
            helper = new MimeMessageHelper(message, true);
            //设置内容
            helper.setSubject("下单成功通知");
            helper.setTo(whoShouldBeNotified);
            helper.setFrom(from);
            helper.setText("<html>\r\n" +
                    "	<body>\r\n" +
                    "		<div style=\"width: 300px; margin: auto;\">\r\n" +
                    "           <h1>订单已被付款！订单号码:" + order.getOrderNumber() + "</h1>" +
                    "           <h1>订单金额:" + order.getAmount() + "</h1>" +
                    "           <h1>使用优惠券:" + order.getUseDecoupon() + ",id:"+ order.getDecouponId() + "</h1>" +
                    "           <h1>使用积分:" + order.getUseCredit() + ",数量:" + order.getCredit()  + "</h1>" +
                    "		</div>\r\n" +
                    "	</body>\r\n" +
                    "</html>", true);
            sender.send(message);
            logger.info("发送邮件成功");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            logger.info("发送邮件失败" + e.getMessage());
            return false;
        }
    }
}
