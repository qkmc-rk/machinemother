package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
    @ApiOperation(value = "[user]获取小程序码",notes = "必须是登录用户才行，因为返回的小程序码需要带上用户的ID，小程序码唯一")
    public ResponseEntity getQrCode(HttpServletRequest request){
        ResponseEntity<String> responseEntity = new ResponseEntity<>();
        String token = request.getHeader("token");
        //鉴权那个地方才刚刚做了token存在验证，这么短时间token不可能丢失吧？
        Integer userId = Integer.parseInt(userInfoService.readDataFromRedis(token));
        String qrcodeurl = qrCodeService.getQrCodeUrl(userId);
        if (null == qrcodeurl)
            responseEntity.serverError();
        else
            responseEntity.success(qrcodeurl);
        return  responseEntity;
    }

    @GetMapping("/template")
    @Authentication(pass = false)
    @ApiOperation(value = "获取所有小程序模板信息，前端自由加载所需图片",notes = "必须是登录用户才行，因为返回的小程序码需要带上用户的ID，小程序码唯一")
    public ResponseEntity getTemplate(){
        ResponseEntity<List<Template>>  responseEntity = new ResponseEntity<>();
        List<Template> templates = qrCodeService.getTemplate();
        if (null != templates){
            //成功
            responseEntity.success(templates);
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
    @ApiOperation(value = "[admin]管理员上传一张图片模板存储到数据库",notes = "")
    public ResponseEntity putOneTemplate(@RequestParam MultipartFile img){
        ResponseEntity responseEntity = new ResponseEntity();
        boolean rs = qrCodeService.putTemplate(img);
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
    @ApiOperation(value = "[admin]管理员修改数据库中的模板信息",notes = "")
    public ResponseEntity alterOneTemplate(@PathVariable Integer id, @RequestParam MultipartFile img){
        ResponseEntity responseEntity = new ResponseEntity();
        boolean rs = qrCodeService.update(id,img);
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return responseEntity;
    }

    @DeleteMapping("/template/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[admin]管理员删除一张数据库中存储的模板照片",notes = "")
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
