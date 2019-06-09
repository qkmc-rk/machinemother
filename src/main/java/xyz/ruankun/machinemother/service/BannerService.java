package xyz.ruankun.machinemother.service;

import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.entity.Banner;

import java.util.List;

public interface BannerService {
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
}
