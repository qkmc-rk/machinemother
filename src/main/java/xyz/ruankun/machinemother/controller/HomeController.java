package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.annotation.小坏蛋;
import xyz.ruankun.machinemother.entity.Advertisement;
import xyz.ruankun.machinemother.entity.Banner;
import xyz.ruankun.machinemother.entity.Recommend;
import xyz.ruankun.machinemother.service.HomeService;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

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
    HomeService homeService;


    @GetMapping("/banner")
    @Authentication(pass = false)
    public ResponseEntity getBanners(){
        return getDataResult(homeService.getAllVisibleBanner());
    }

    @PutMapping("/banner")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity putBanner(@RequestParam Integer productId,@RequestParam MultipartFile image){
        return getTrueOrFalseResult(homeService.putBanner(productId, image));
    }

    @DeleteMapping("/banner/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity deleteBanner(@PathVariable Integer id){
        return getTrueOrFalseResult(homeService.deleteBanner(id));
    }

    @PostMapping("/banner/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity alterBanner(@PathVariable Integer id,@RequestBody Banner banner){
        banner.setId(id);   //看似不起作用的一点至关重要，万一前台数据不对，后台不考虑这个问题，后果就很严重
        return getTrueOrFalseResult(homeService.alterBanner(id,banner));
    }

    @GetMapping("/adv")
    @Authentication(pass = false)
    public ResponseEntity getAllAdv(){
        return  getDataResult(homeService.getAllVisibleAdv());
    }

    @PutMapping("/adv")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity addOneAdvertisement(@RequestBody Advertisement advertisement){
        //数据校验省略
        return getDataResult(homeService.putAdvertisement(advertisement));
    }

    @DeleteMapping("/adv/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity deleteAdv(@PathVariable Integer id){
        return getTrueOrFalseResult(homeService.deleteAdv(id));
    }

    @PostMapping("/adv/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity alterAdv(@PathVariable Integer id, @RequestBody Advertisement advertisement){
        advertisement.setId(id);
        return getDataResult(homeService.alterAdv(advertisement));
    }

    @GetMapping("/recommend")
    @Authentication(pass = false)
    public ResponseEntity getRecommend(){
        return getDataResult(homeService.getAllRecommend());
    }

    @PutMapping("/recommend")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity putRecommend(@RequestBody Recommend recommend){
        //省略数据校验
        return getDataResult(homeService.putRecommend(recommend));
    }

    @DeleteMapping("/recommend/{id}")
    public ResponseEntity deleteRecommend(@PathVariable Integer id){
        return getTrueOrFalseResult(homeService.deleteRecommend(id));
    }

    /**
     * 代码这个东西浓缩就是精华
     * @param rs 真真假假
     * @return 假假真真
     */
    @小坏蛋//人生处处是惊喜
    private ResponseEntity getTrueOrFalseResult(boolean rs){
        ResponseEntity responseEntity = new ResponseEntity();
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return responseEntity;
    }

    /**
     * 浓缩就是精华
     * @param data  缩阴功
     * @param <T> 缩阴功
     * @return 缩阴功的结果
     */
    @小坏蛋
    private <T> ResponseEntity<T> getDataResult(T data){
        ResponseEntity<T> responseEntity = new ResponseEntity<>();
        if (null != data)
            responseEntity.success(data);
        else
            responseEntity.serverError();
        return responseEntity;
    }


}
