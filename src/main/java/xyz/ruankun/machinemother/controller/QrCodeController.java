package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Template;
import xyz.ruankun.machinemother.service.QrCodeService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/qrcode")
@Api(value = "二维码获取和二维码模板获取相关的操作由QrCodeController来实现")
public class QrCodeController {

    @Autowired
    UserInfoService userInfoService;

    @Autowired
    QrCodeService qrCodeService;
    /**
     *  用户获取小程序码
     * @return
     */
    @GetMapping("")
    @Authentication(role = AuthAopConstant.USER)
    @ApiOperation(value = "[用户]获取小程序码",notes = "必须是登录用户才行，因为返回的小程序码需要带上用户的ID，小程序码唯一,当传入productId字段时，scen的字段为(String)  uid&productId")
    public ResponseEntity getQrCode(@RequestHeader String token,
                                    @ApiParam(value = "产品的id productId,该字段应该与page字段搭配使用") @RequestParam(required = false) Integer productId,
                                    @ApiParam(value = "必须是已经发布的小程序存在的页面（否则报错），例如 pages/index/index, 根路径前不要填加 /,不能携带参数（参数请放在scene字段里），如果不填写这个字段，默认跳主页面")
                                        @RequestParam(required = false) String page){
        ResponseEntity<Map> responseEntity = new ResponseEntity<>();
        //鉴权那个地方才刚刚做了token存在验证，这么短时间token不可能丢失吧？
        Integer userId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        Map<String, String> qrcodeurl = qrCodeService.getQrCodeUrl(userId, productId, page);
        if (null != qrcodeurl.get("error"))
            responseEntity.error(Constant.FAILURE_CODE,"error occured", qrcodeurl);
        else
            responseEntity.success(qrcodeurl);
        return  responseEntity;
    }

    @GetMapping("/template")
    @ApiOperation(value = "[匿名]获取所有小程序模板信息，前端自由加载所需图片",notes = "必须是登录用户才行，因为返回的小程序码需要带上用户的ID，小程序码唯一")
    public ResponseEntity getTemplate(){
        ResponseEntity<List<Template>>  responseEntity = new ResponseEntity<>();
        List<Template> templates = qrCodeService.getTemplate();
        List<Template> templates1 = new ArrayList<>();
        for (Template t:templates){
            if (t.getProductId().intValue() < 1){
                t.setProductId(null);
            }
            templates1.add(t);
        }
        if (null != templates1){
            //成功
            responseEntity.success(templates1);
        }else{
            //失败
            responseEntity.serverError();
        }
        return responseEntity;
    }

    /**
     * 只有管理员能干
     * @param img 图片文件
     * @return 返回上传成功
     */
    @PutMapping("/template")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]管理员上传一张图片模板存储到数据库",notes = "")
    public ResponseEntity putOneTemplate(@RequestParam MultipartFile img,@RequestParam Integer productId){
        ResponseEntity responseEntity = new ResponseEntity();
        boolean rs = qrCodeService.putTemplate(img,productId);
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return  responseEntity;
    }
    /**
     * 管理员实现数据库中模板信息的修改
     * @param id 数据库记录的id
     * @param img 二进制，仅支持jpg jpeg png
     * @return 返回结果
     */
    @PostMapping("/template/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]管理员修改数据库中的模板信息",notes = "")
    public ResponseEntity alterOneTemplate(@PathVariable Integer id, @RequestParam MultipartFile img, @RequestParam(required = false) Integer productId){
        ResponseEntity responseEntity = new ResponseEntity();
        boolean rs = qrCodeService.update(id,img, productId);
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return responseEntity;
    }

    @DeleteMapping("/template/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]管理员删除一张数据库中存储的模板照片",notes = "")
    public ResponseEntity deleteTemplate(@PathVariable Integer id){
        ResponseEntity responseEntity = new ResponseEntity();
        boolean rs = qrCodeService.deleteOneById(id);
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.error(Constant.FAILURE_CODE,"可能是你传的ID不对，删除失败",null);

        return responseEntity;
    }
}
