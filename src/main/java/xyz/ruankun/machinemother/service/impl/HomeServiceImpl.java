package xyz.ruankun.machinemother.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.entity.Advertisement;
import xyz.ruankun.machinemother.entity.Banner;
import xyz.ruankun.machinemother.entity.Recommend;
import xyz.ruankun.machinemother.repository.AdvertisementRepository;
import xyz.ruankun.machinemother.repository.BannerRepository;
import xyz.ruankun.machinemother.repository.RecommendRepository;
import xyz.ruankun.machinemother.service.HomeService;
import xyz.ruankun.machinemother.util.QiNiuFileUtil;

import java.util.List;

@Service
public class HomeServiceImpl implements HomeService {

    private Logger logger = LoggerFactory.getLogger(HomeServiceImpl.class);

    @Autowired
    BannerRepository bannerRepository;
    @Autowired
    AdvertisementRepository advertisementRepository;
    @Autowired
    RecommendRepository recommendRepository;

    @Override
    public List<Banner> getAllVisibleBanner() {
        try {
            return bannerRepository.findAllByIsVisibleTrue();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean putBanner(Integer productId, MultipartFile image) {
        Banner banner = new Banner();
        banner.setProductId(productId);

        String imageSrc = QiNiuFileUtil.uploadImageToQiNiu(image);
        if (imageSrc == null){
            logger.error("上传图片遇到一些错误,不能插入banner到数据库");
            return false;
        }
        banner.setImageSrc(imageSrc);
        try {
            bannerRepository.save(banner);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("错误：不能保存banner");
            return false;
        }
        return true;
    }

    @Override
    public boolean deleteBanner(Integer id) {
        try {
            bannerRepository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("删除banner失败");
            return false;
        }
        return true;
    }

    @Override
    public boolean alterBanner(Integer id,Banner banner) {
        try {
            bannerRepository.saveAndFlush(banner);
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("修改banner失败");
            return false;
        }
        return true;
    }

    @Override
    public List<Advertisement> getAllVisibleAdv() {
        try {
            return advertisementRepository.findAllByIsVisible();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("查询所有Adv发生了错误");
            return null;
        }
    }

    @Override
    public Advertisement putAdvertisement(Advertisement advertisement) {
        try {
            return advertisementRepository.save(advertisement);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("不能存储advertisement到数据库，请重试");
            return null;
        }
    }

    @Override
    public boolean deleteAdv(Integer id) {
        try {
            advertisementRepository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("fuck,失误了，删除一个广告的时候出现了一个谁也不知道的问题，天知道");
            return false;
        }
        return true;
    }

    @Override
    public Advertisement alterAdv(Advertisement advertisement) {
        try {
            return advertisementRepository.saveAndFlush(advertisement);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("哎呀，修改一个广告失败，不想写日志了，好特么烦啊，是不是该改用AOP来做日志了。。");
            return null;
        }
    }

    @Override
    public List<Recommend> getAllRecommend() {
        try {
            return recommendRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("操，获取主页的推荐信息居然出错了，屄了狗了");
            return null;
        }
    }

    @Override
    public Recommend putRecommend(Recommend recommend) {
        try {
            return recommendRepository.save(recommend);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("唉，推荐失败");
            return null;
        }
    }

    @Override
    public boolean deleteRecommend(Integer id) {
        try {
            recommendRepository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("fuck error 删除啊推荐失败检查id是否正确");
            return false;
        }
        return true;
    }

}
