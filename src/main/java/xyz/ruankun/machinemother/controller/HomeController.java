package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sun.tools.jconsole.AboutDialog;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.annotation.小坏蛋;
import xyz.ruankun.machinemother.entity.Advertisement;
import xyz.ruankun.machinemother.entity.Banner;
import xyz.ruankun.machinemother.entity.Recommend;
import xyz.ruankun.machinemother.service.HomeService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.Date;

/**
 * 主要控制小程序主页面的一些内容和管理。
 */
@RestController
@RequestMapping("/home")
@CrossOrigin
@Api(value = "主要控制小程序主页面的一些内容和管理")
public class HomeController {

    @Autowired
    HomeService homeService;


    @GetMapping("/banner")
    @ApiOperation(value = "[匿名]获取主页banner", notes = "获取主页的banner，有图片地址和该图片指向的详细那个产品")
    public ResponseEntity getBanners() {
        return getDataResult(homeService.getAllVisibleBanner());
    }

    @PutMapping("/banner")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]管理员增加一个banner")
    public ResponseEntity putBanner(@RequestParam Integer productId, @RequestParam MultipartFile image) {
        return getTrueOrFalseResult(homeService.putBanner(productId, image));
    }

    @DeleteMapping("/banner/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]删除一个banner，管理员操作")
    public ResponseEntity deleteBanner(@PathVariable Integer id) {
//        return getTrueOrFalseResult(homeService.deleteBanner(id));
        return ControllerUtil.parData(homeService.deleteBanner(id), null);
    }

    @PostMapping("/banner/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]操作,修改一个banner")
    public ResponseEntity alterBanner(@PathVariable Integer id, @RequestBody Banner banner) {
        banner.setId(id);   //看似不起作用的一点至关重要，万一前台数据不对，后台不考虑这个问题，后果就很严重
        banner.setGmtModified(new Date());
        banner.setGmtCreate(null);
        return getTrueOrFalseResult(homeService.alterBanner(id, banner));
    }

    @GetMapping("/adv")
    @ApiOperation(value = "[匿名]操作,获取广告")
    public ResponseEntity getAllAdv() {
        return getDataResult(homeService.getAllVisibleAdv());
    }

    @PutMapping("/adv")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]操作,增加一个广告")
    public ResponseEntity addOneAdvertisement(@RequestBody Advertisement advertisement) {
        //数据校验省略
        advertisement.setGmtCreate(new Date());
        advertisement.setGmtModified(new Date());
        advertisement.setVisible(true);
        return getDataResult(homeService.putAdvertisement(advertisement));
    }

    @DeleteMapping("/adv/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]操作,删除操作")
    public ResponseEntity deleteAdv(@PathVariable Integer id) {
//        return getTrueOrFalseResult(homeService.deleteAdv(id));
        return ControllerUtil.parData(homeService.deleteAdv(id), null);
    }

    @PostMapping("/adv/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]操作,修改一个广告")
    public ResponseEntity alterAdv(@PathVariable Integer id, @RequestBody Advertisement advertisement) {
        advertisement.setId(id);
        return getDataResult(homeService.alterAdv(advertisement));
    }

    @GetMapping("/recommend")
    @ApiOperation(value = "[匿名]获取推荐，有详情查看返回数据的格式")
    public ResponseEntity getRecommend() {
        return getDataResult(homeService.getAllRecommend());
    }

    @PutMapping("/recommend")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]操作,推荐一个产品")
    public ResponseEntity putRecommend(@RequestBody Recommend recommend) {
        recommend.setGmtCreate(new Date());
        recommend.setGmtModified(new Date());
        return getDataResult(homeService.putRecommend(recommend));
    }

    @DeleteMapping("/recommend/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]操作,删除一个推荐")
    public ResponseEntity deleteRecommend(@PathVariable Integer id) {
        return getTrueOrFalseResult(homeService.deleteRecommend(id));
    }

    /**
     * 代码这个东西浓缩就是精华
     *
     * @param rs 真真假假
     * @return 假假真真
     */
    @小坏蛋//人生处处是惊喜
    private ResponseEntity getTrueOrFalseResult(boolean rs) {
        ResponseEntity responseEntity = new ResponseEntity();
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return responseEntity;
    }

    /**
     * 浓缩就是精华
     *
     * @param data 缩阴功
     * @param <T>  缩阴功
     * @return 缩阴功的结果
     */
    @小坏蛋
    private <T> ResponseEntity<T> getDataResult(T data) {
        ResponseEntity<T> responseEntity = new ResponseEntity<>();
        if (null != data)
            responseEntity.success(data);
        else
            responseEntity.error(Constant.FAILURE_CODE,"null data get",null);
        return responseEntity;
    }


}
