package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Banner;
import xyz.ruankun.machinemother.service.BannerService;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.List;

/**
 * 主要控制小程序主页面的一些内容和管理。
 *
 *
 */
@RestController
@RequestMapping("/home")
@CrossOrigin
@Api(value = "主要控制小程序主页面的一些内容和管理")
public class HomeController {

    @Autowired
    BannerService bannerService;

    /**
     *
     * 获取主页banner的属性，包含产品id,图片等.
     * @return
     *
     */
    @GetMapping("/banner")
    @Authentication(pass = false)
    public ResponseEntity getBanners(){
        ResponseEntity<List<Banner>> responseEntity = new ResponseEntity<>();
        List<Banner> banners = bannerService.getAllVisibleBanner();
        if (banners != null)
            responseEntity.success(banners);
        else
            responseEntity.serverError();
        return responseEntity;
    }

    /**
     * 上传banner
     * @param productId
     * @param image
     * @return
     */
    @PutMapping("/banner")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity putBanner(@RequestParam Integer productId,@RequestParam MultipartFile image){
        ResponseEntity<List<Banner>> responseEntity = new ResponseEntity<>();
        boolean rs = bannerService.putBanner(productId, image);
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return responseEntity;
    }

}
