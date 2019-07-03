package xyz.ruankun.machinemother.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import xyz.ruankun.machinemother.entity.Template;
import xyz.ruankun.machinemother.repository.TemplateRepository;
import xyz.ruankun.machinemother.service.QrCodeService;
import xyz.ruankun.machinemother.util.MD5Util;
import xyz.ruankun.machinemother.util.QiNiuFileUtil;
import xyz.ruankun.machinemother.util.constant.WxAccessTokenReturnConstant;
import xyz.ruankun.machinemother.vo.weixin.WxAccessToken;
import xyz.ruankun.machinemother.vo.weixin.WxServerResult;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class QrCodeServiceImpl implements QrCodeService {

    private Logger logger = LoggerFactory.getLogger(QrCodeServiceImpl.class);

    @Value("${weixin.secret}")
    private String SECRET;
    @Value("${weixin.appid}")
    private String APPID;

    @Value("${weixin.access_token.api}")
    private String ACCESS_TOKEN_API;

    @Value("${weixin.qrcode.api}")
    private String QRCODE_API;

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private TemplateRepository templateRepository;

    @Override
    public Map<String, String> getQrCodeUrl(Integer userId) {
        String accessToken = getAccessToken();
        if (accessToken == null)
            return null;
        System.out.println("now begin to get qrcode...");
        StringBuilder uri = new StringBuilder(QRCODE_API);
        uri.append("?access_token=");
        uri.append(accessToken);
        //准备参数
        Map<String,String> params = new HashMap<>();
        //这个参数至关重要，在小程序通过scene获取userId
        params.put("scene",userId.toString());
        params.put("width","300");
        params.put("is_hyaline","true");
        params.put("auto_color","true");
        System.out.println("获取二维码的uri:" + uri.toString());
        System.out.println("获取二维码的参数:" + params.toString());
        return postforImg(uri.toString(),params);
    }

    @Override
    public String getAccessToken() {
        String access_token;
        //拼接
        StringBuilder uri = new StringBuilder(ACCESS_TOKEN_API);
        uri.append("?grant_type=client_credential&appid=");
        uri.append(APPID);
        uri.append("&secret=");
        uri.append(SECRET);
        String strBody = getBody(restTemplate,uri.toString());
        //取出来access_token
        ObjectMapper objectMapper = new ObjectMapper();
        WxAccessToken wxAccessToken;
        try {
            wxAccessToken = objectMapper.readValue(strBody, WxAccessToken.class);
            System.out.println("access_token:" + wxAccessToken.toString());
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        Integer errCode = wxAccessToken.getErrCode();
        if (null == errCode){
            //请求成功
            access_token = wxAccessToken.getAccessToken();

        }else{
            if (wxAccessToken.getErrCode().equals(WxAccessTokenReturnConstant.ERRCODE_SERVER_BUSY))
                logger.error("server busy so cant get qrcode from weixin server");
            if (wxAccessToken.getErrCode().equals(WxAccessTokenReturnConstant.ERRCODE_WRONG_APPSECRET))
                logger.error("appsecret wrong so cant get qrcode from weixin server");
            if (wxAccessToken.getErrCode().equals(WxAccessTokenReturnConstant.ERRCODE_GRANT_TYPE))
                logger.error("grant_type is wrong so cant get qrcode from weixin server");
            if (wxAccessToken.getErrCode().equals(WxAccessTokenReturnConstant.ERRCODE_WRONG_APPID))
                logger.error("appid is wrong so cant get qrcode from weixin server");

            access_token = null;
        }
        return access_token;
    }

    @Override
    public List<Template> getTemplate() {
        return templateRepository.findAll();
    }

    /**
     * 保存一个模板
     * 保存一个模板 可以是更新进去，也可以是添加进去，如果
     * 不传入id则是添加
     * @param img 图片二进制流
     * @return 返回保存成功
     */
    public Boolean putTemplate(MultipartFile img, Integer... id) {
        //第一步上传到七牛云
        String imgPath;
        imgPath = QiNiuFileUtil.uploadImageToQiNiu(img);
        if (imgPath == null){
            logger.info("上传到七牛云出现错误");
            return false;
        }
        //第二步，保存到数据库
        Template template = new Template();
        template.setImgpath(imgPath);
        if (id.length > 0){
            template.setId(id[0]);
            try {
                logger.info("传入的模板ID是：{}",id);
                template = templateRepository.saveAndFlush(template);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }else {
            try {
                template = templateRepository.save(template);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return null != template;
    }

    /**
     * 更新嘛，看接口的注释 调用了 put方法来依赖实现
     * @param id  ID
     * @param img 图片二进制文件
     * @return
     */
    @Override
    public boolean update(Integer id, MultipartFile img) {
        return putTemplate(img,id);
    }

    /**
     * 删除一个template
     * @param id ID
     * @return  真假难辨
     */
    @Override
    public boolean deleteOneById(Integer id) {
        try {
            templateRepository.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


    /**
     * 该方法发送简单的get请求，并获取相应数据
     * @param restTemplate
     * @param uri
     * @return 服务器响应数据
     */
    private String getBody(RestTemplate restTemplate,String uri){
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(uri, String.class);
        if(responseEntity.getStatusCodeValue() == 200)
            return responseEntity.getBody();
        return null;
    }

    /**
     * 该方法发送post请求，并获取相应图片,然后把数据传到七牛云服务器上
     * 因为post需要拿去二进制数据图片，所以不能使用restTemplate
     * @param uri  获取图片的地址
     * @param params 请求带着的各种参数
     * @return 图片的url地址
     */
    private Map<String, String> postforImg(String uri, Map<String,?> params){
        Map<String, String> map = new HashMap<>();
        CloseableHttpClient httpClient = HttpClientBuilder.create().build();
        HttpPost httpPost = new HttpPost(uri);  // 接口
        httpPost.addHeader("content-type", "application/json");
        ObjectMapper objectMapper = new ObjectMapper();
        String body = null;
        StringEntity entity = null;
        try {
             body = objectMapper.writeValueAsString(params);
            entity= new StringEntity(body);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            logger.error("参数传入错误，无法转换成JSON，无法请求二维码");
            map.put("error","参数传入错误，无法转换成JSON，无法请求二维码");
            return (map);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            logger.error("无法生成StringEntity，检查传入参数");
            map.put("error","无法生成StringEntity，检查传入参数");
            return (map);
        }
        entity.setContentType("img/png");

        httpPost.setEntity(entity);
        HttpResponse response;
        InputStream inputStream = null;
        try {
            response = httpClient.execute(httpPost);
            inputStream = response.getEntity().getContent();
        } catch (IOException e) {
            e.printStackTrace();
        }
        /**
         * 2019.6.12 这里存在一个潜在的错误没加入inputStream不是图片怎么办？？？
         * 我没做处理，最后可能得到错误的结果，再说吧
         * 2019.7.3 看来这个验证不做不行，不然前台搞不明白为什么出错，出错了还要赖在我的身上
         */
        byte[] b = new byte[10240];
        try {
            inputStream.read(b);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("错误！！读取输入流出错");
            map.put("error","错误！！读取输入流出错");
            return (map);
        }
        String bStr = new String(b);
        ObjectMapper o = new ObjectMapper();
        WxServerResult wxServerResult = null;
        try {
            wxServerResult = o.readValue(bStr,WxServerResult.class);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error("错误！！输入流无法转换成JsonObject");
            map.put("error","错误！！输入流无法转换成JsonObject");
            return (map);
        }
        if(null != wxServerResult && wxServerResult.getErrcode() != null){
            logger.error("发生了错误信息:" + wxServerResult.getErrcode() + wxServerResult.getErrmsg());
            map.put("error","发生了错误信息:" + wxServerResult.getErrcode() + wxServerResult.getErrmsg());
            return (map);
        }
        //调用七牛云对象存储存上图片
        System.out.println("获取小程序码返回的数据：" + inputStream.toString());
        String imgUrl = QiNiuFileUtil.uploadToQiNiu(inputStream,MD5Util.md5("") + ".png");
        if (imgUrl == null){
            logger.info("图片上传失败了,七牛云文件助手返回了NULL值");
            map.put("error","图片上传失败了,七牛云文件助手返回了NULL值");
            return (map);
        }
        logger.info("上传成功:" + imgUrl);
        map.put("imgUrl",imgUrl);
        return (map);
    }
}
