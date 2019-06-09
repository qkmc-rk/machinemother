package xyz.ruankun.machinemother.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.Template;
import xyz.ruankun.machinemother.service.QrCodeService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/qrcode")
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
    public ResponseEntity putOneTemplate(@RequestParam MultipartFile img){
        ResponseEntity responseEntity = new ResponseEntity();
        boolean rs = qrCodeService.putTemplate(img);
        if (rs)
            responseEntity.success(null);
        else
            responseEntity.serverError();
        return  responseEntity;
    }
}
