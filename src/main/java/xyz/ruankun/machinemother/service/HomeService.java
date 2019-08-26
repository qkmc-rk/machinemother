package xyz.ruankun.machinemother.service;

import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.entity.Advertisement;
import xyz.ruankun.machinemother.entity.Banner;
import xyz.ruankun.machinemother.entity.Recommend;

import java.util.List;

public interface HomeService {
    /**
     * 获取所有看得见的banner
     * @return
     */
    List<Banner> getAllVisibleBanner();

    /**
     * 保存
     * @param productId
     * @param image
     * @return
     */
    boolean putBanner(Integer productId, MultipartFile image);

    /**
     * 删除banner
     * @param id
     * @return
     */
    Integer deleteBanner(Integer id);

    boolean alterBanner(Integer id, Banner banner);


    List<Advertisement> getAllVisibleAdv();

    Advertisement putAdvertisement(Advertisement advertisement);

    Integer deleteAdv(Integer id);

    Advertisement alterAdv(Advertisement advertisement);

    List<Recommend> getAllRecommend();

    Recommend putRecommend(Recommend recommend);
    Recommend putRecommend(Integer productId, MultipartFile img);

    boolean deleteRecommend(Integer id);
}
