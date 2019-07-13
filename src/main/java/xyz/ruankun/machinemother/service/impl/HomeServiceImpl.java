package xyz.ruankun.machinemother.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.entity.Advertisement;
import xyz.ruankun.machinemother.entity.Banner;
import xyz.ruankun.machinemother.entity.Product;
import xyz.ruankun.machinemother.entity.Recommend;
import xyz.ruankun.machinemother.repository.AdvertisementRepository;
import xyz.ruankun.machinemother.repository.BannerRepository;
import xyz.ruankun.machinemother.repository.ProductRepository;
import xyz.ruankun.machinemother.repository.RecommendRepository;
import xyz.ruankun.machinemother.service.HomeService;
import xyz.ruankun.machinemother.util.DataCode;
import xyz.ruankun.machinemother.util.EntityUtil;
import xyz.ruankun.machinemother.util.QiNiuFileUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Iterator;
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
    @Resource
    private ProductRepository productRepository;

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
        if (imageSrc == null) {
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
    public Integer deleteBanner(Integer id) {
        try {
            Integer result = bannerRepository.deleteById(id.intValue());
            if (result < 0) {
                return DataCode.DATA_OPERATION_FAILURE;
            } else {
                return DataCode.DATA_OPERATION_SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("删除banner失败");
            return DataCode.DATA_OPERATION_ERROR;
        }
    }

    @Override
    public boolean alterBanner(Integer id, Banner banner) {
        try {
            Banner banner1 = bannerRepository.findById(id.intValue());
            if (banner1 != null){
                EntityUtil.update(banner,banner1);
                bannerRepository.saveAndFlush(banner);
            }
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
            return advertisementRepository.findAllByIsVisible(true);
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
    public Integer deleteAdv(Integer id) {
        try {
            Integer result = advertisementRepository.deleteById(id.intValue());
            if(result<0){
                return DataCode.DATA_OPERATION_FAILURE;
            }else{
                return DataCode.DATA_OPERATION_SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("fuck,失误了，删除一个广告的时候出现了一个谁也不知道的问题，天知道");
            return DataCode.DATA_OPERATION_ERROR;
        }
    }

    @Override
    public Advertisement alterAdv(Advertisement advertisement) {
        try {
            Advertisement advertisement1 = advertisementRepository.findById(advertisement.getId().intValue());
            EntityUtil.update(advertisement,advertisement1);
            return advertisementRepository.saveAndFlush(advertisement);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("哎呀，修改一个广告失败，不想写日志了，好特么烦啊，是不是该改用AOP来做日志了。。");
            return null;
        }
    }

    @Override
    public List<Recommend> getAllRecommend() {
        List<Recommend> recommends = null;
        try {
            recommends = recommendRepository.findAll();
            if (recommends == null) {
                logger.error("lzzscl，查找失败");
                return null;
            } else {
                Iterator<Recommend> iterator = recommends.iterator();
                while (iterator.hasNext()) {
                    Recommend recommend = iterator.next();
                    Product product = null;
                    try {
                        product = productRepository.findById(recommend.getProductId().intValue());
                    } catch (Exception e) {
                        e.printStackTrace();
                        logger.error("sorry,product not found:" + recommend.getProductId());
                    }
                    if (product == null) {
                        logger.error("没有product，内部有错误数据" + recommend.getId() + "," + iterator.next().getProductId());
                        iterator.remove();
                    } else {
                        recommend.setTitle(product.getTitle());
                    }
                }
            }
            return recommends;
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("操，获取主页的推荐信息居然出错了，屄了狗了");
            return null;
        }
    }

    @Override
    public Recommend putRecommend(Recommend recommend) {
        Product product = productRepository.findById(recommend.getProductId().intValue());
        if (product == null) {
            logger.error("lzzscl,productid:" + recommend.getProductId() + "不存在");
            return null;
        } else {
            try {
                recommend.setTitle(product.getTitle());
                return recommendRepository.save(recommend);
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("唉，推荐失败");
                return null;
            }
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
