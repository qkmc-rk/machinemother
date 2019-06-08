package xyz.ruankun.machinemother.util;

import com.google.gson.Gson;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 对象存储工具
 */
public class QiNiuFileUtil {

    private static final Logger logger = LoggerFactory.getLogger(QiNiuFileUtil.class);

    private static String accessKey;
    private static String secretKey;
    private static String dns;

    /**
     * 加载七牛云的配置文件
     */
    static{
        Properties properties = new Properties();
        InputStream inputStream = QiNiuFileUtil.class.getClassLoader()
                .getResourceAsStream("qiniuyun.properties");
        try {
            properties.load(inputStream);
            accessKey = properties.getProperty("accessKey");
            secretKey = properties.getProperty("secretKey");
            dns = properties.getProperty("dns");
        } catch (IOException e) {
            logger.error("qiniu cloud load properties[name:qiniuyun.properties] in classpath failed.");
            e.printStackTrace();
        }
    }

    /**
     *
     * 上传文件到七牛云的工具
     * @param inputStream
     * @return
     */
    public static String uploadToQiNiu(InputStream inputStream,String key){

        if(inputStream == null){
            logger.info("传入的图片二进制流不存在，忽略上传过程");
            return null;
        }
        //zone0表示华东区域，该bucket在华东
        Configuration configuration = new Configuration(Zone.zone0());
        UploadManager uploadManager = new UploadManager(configuration);
        String bucket = "public";
        Auth auth = Auth.create(accessKey, secretKey);
        String upToken = auth.uploadToken(bucket);
        //System.out.println(upToken);
        try {
            Response response = uploadManager.put(inputStream,key,upToken,null,null);
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            System.out.println(putRet.key);
            System.out.println(putRet.hash);
            return getDns() + "/" + putRet.key;
        } catch (IOException e) {
            e.printStackTrace();
        }
        logger.info("请求时发生了错误信息");
        return null;
    }

    public static String getDns(){
        return dns;
    }
}
