package xyz.ruankun.machinemother.controller;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.annotation.小坏蛋;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.QiNiuFileUtil;
import xyz.ruankun.machinemother.vo.ResponseEntity;

/**
 *
 * 这是一个文件上传的工具，主要是上传图片等。
 *
 */
@RestController
@RequestMapping("/upload")
@CrossOrigin
@Api(value = "一切上传文件的接口都靠这个老几实现了")
public class FileController {

    @Autowired
    UserInfoService userInfoService;

    @PutMapping("/image")
    @ApiOperation("[匿名]上传图片，不是图片的话就会返回不想得到的喔")
    public ResponseEntity uploadFile(@RequestHeader String token, @RequestParam MultipartFile image){
        if (userInfoService.readDataFromRedis(token) == null ||userInfoService.readDataFromRedis(token).equals(""))
            return getTrueOrFalseResult(false);
        return  getDataResult(QiNiuFileUtil.uploadImageToQiNiu(image));
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
            responseEntity.error(Constant.FAILURE_CODE,"error,not permitted,with your token please!",null);
        return responseEntity;
    }
}
