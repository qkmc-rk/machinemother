package xyz.ruankun.machinemother.schedule;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Decoupon;
import xyz.ruankun.machinemother.entity.DecouponCDKey;
import xyz.ruankun.machinemother.repository.DecouponCDKeyRepository;
import xyz.ruankun.machinemother.repository.DecouponRepository;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;

@Component
@EnableScheduling
public class MySchedule {

    Log logger = LogFactory.getLog(MySchedule.class);

    @Resource
    DecouponRepository decouponRepository;

    @Resource
    DecouponCDKeyRepository decouponCDKeyRepository;

    /**
     * 每日0点0分30秒时刷新数据库中未使用
     */
    @Scheduled(cron = "30 0 0 * * ?")
    @Transactional(rollbackFor = Exception.class)
    public void flushDecoupon() {
        logger.info("start flush decounpon and cdKey");
        //未使用过
        long time = System.currentTimeMillis();

        Set<Decoupon> decoupons = decouponRepository.findAllByIsUsedAndIsPast(false, false);
        Set<DecouponCDKey> cdKeys = decouponCDKeyRepository.findAllByIsExchanged(false);

        Set<Decoupon> saveDecoupons = new HashSet<>();
        Set<DecouponCDKey> saveCDkeys = new HashSet<>();
        //检查decoupon
        for (Decoupon decoupon : decoupons) {
            if (decoupon.getGmtPast().getTime() < time) {
                decoupon.setPast(true);
                saveDecoupons.add(decoupon);
            }
        }
        decouponRepository.saveAll(saveDecoupons);

        //检查cdkey
        for (DecouponCDKey decouponCDKey : cdKeys) {
            if (!decouponCDKey.isPast() && decouponCDKey.getGmtPast().getTime() < time) {
                decouponCDKey.setPast(true);
                saveCDkeys.add(decouponCDKey);
            }
        }
        decouponCDKeyRepository.saveAll(saveCDkeys);

        logger.info("finish flush decoupon and cdkey");
    }
}
