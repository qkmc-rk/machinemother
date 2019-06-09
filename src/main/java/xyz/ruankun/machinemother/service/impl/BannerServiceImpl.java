package xyz.ruankun.machinemother.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.entity.Banner;
import xyz.ruankun.machinemother.repository.BannerRepository;
import xyz.ruankun.machinemother.service.BannerService;
import xyz.ruankun.machinemother.util.QiNiuFileUtil;

import java.util.List;

@Service
public class BannerServiceImpl implements BannerService {

    private Logger logger = LoggerFactory.getLogger(BannerServiceImpl.class);

    @Autowired
    BannerRepository bannerRepository;

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

}
