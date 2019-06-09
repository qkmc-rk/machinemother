package xyz.ruankun.machinemother.service;

import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.entity.Template;

import java.util.List;

public interface QrCodeService {

    /**
     * 通过 accesstoken 和用户id生成一个小程序分享二维码，这个二维码主要含有用户Id
     * 强调一下:主要含有用户ID
     * @param userId
     * @return qrcode url
     */
    String getQrCodeUrl(Integer userId);

    /**
     * 你要获取二维码,你必须得有这个access_token.对吧？
     * @return access_token
     */
    String getAccessToken();

    /**
     * 获取数据库中全部的template模板
     * @return
     */
    List<Template> getTemplate();

    /**
     * 将图片的url存到数据库中
     * @param img 要保存的文件
     * @return 是否成功
     */
    Boolean putTemplate(MultipartFile img,Integer... id);

    /**
     * 更新模板图片，根据传入的ID属性更改
     * @param id  ID
     * @param img 图片二进制文件
     * @return 更新是否成功
     */
    boolean update(Integer id, MultipartFile img);

    /**
     * 删除一个嘛
     * @param id
     * @return
     */
    boolean deleteOneById(Integer id);
}