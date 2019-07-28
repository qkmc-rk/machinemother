package xyz.ruankun.machinemother.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import xyz.ruankun.machinemother.util.CloseUtil;
import xyz.ruankun.machinemother.util.MD5Util;
import xyz.ruankun.machinemother.util.QiNiuFileUtil;
import xyz.ruankun.machinemother.vo.weixin.WxServerResult;

import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class QrCodeUtil {
    private Logger logger = LoggerFactory.getLogger(QrCodeUtil.class);
    /**
     * 获取二维码的方法
     * @param uri
     * @param params
     * @return
     */
    public  Map<String,String> getminiqrQr(String uri, Map<String,?> params) {
        Map<String, String> map = new HashMap<>();
        RestTemplate rest = new RestTemplate();
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            MultiValueMap<String, String> headers = new LinkedMultiValueMap<>();
            HttpEntity requestEntity = new HttpEntity(params, headers);
            ResponseEntity<byte[]> entity = rest.exchange(uri, HttpMethod.POST, requestEntity, byte[].class, new Object[0]);
            byte[] result = entity.getBody();
            inputStream = new ByteArrayInputStream(result);

            //FileOutputStream fileOutputStream = new FileOutputStream(new File("/Users/ruan/Desktop/1.png"));
            //fileOutputStream.write(result);
            //这里的inptStream应该是图片

            ObjectMapper o = new ObjectMapper();
            String bStr = new String(result);
            WxServerResult wxServerResult = null;
            try {
                wxServerResult = o.readValue(bStr,WxServerResult.class);
            } catch (IOException e) {
                logger.info("不是Json数据，那应该是图片二进制数据");
            }
            if(null != wxServerResult && wxServerResult.getErrcode() != null){
                map.put("error","发生了错误信息:" + wxServerResult.getErrcode() + wxServerResult.getErrmsg());
                logger.error("发生了错误信息:" + wxServerResult.getErrcode() + wxServerResult.getErrmsg());
                return (map);
            }

            String imgUrl = QiNiuFileUtil.uploadToQiNiuWithHttps(inputStream, MD5Util.md5(new Date().toString()) + ".png");
            if (imgUrl == null){
                map.put("error","图片上传失败了,七牛云文件助手返回了NULL值");
                return (map);
            }
            map.put("imgUrl",imgUrl);
            return (map);
        } catch (Exception e) {
            System.out.println("调用小程序生成微信永久小程序码URL接口异常" + e);
        } finally {
            CloseUtil.closeInAndOutPutStream(inputStream,outputStream);
        }
        return null;
    }

    public static QrCodeUtil getInstance() {
        return new QrCodeUtil();
    }

    /**
     * 读取输入流的方法封装
     * @param inStream
     * @return
     * @throws Exception
     */
    public static byte[] readInputStream(InputStream inStream) throws Exception {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        //创建一个Buffer字符串
        byte[] buffer = new byte[1024];
        //每次读取的字符串长度，如果为-1，代表全部读取完毕
        int len = 0;
        //使用一个输入流从buffer里把数据读取出来
        while ((len = inStream.read(buffer)) != -1) {
            //用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度
            outStream.write(buffer, 0, len);
        }
        //关闭输入流
        inStream.close();
        //把outStream里的数据写入内存
        return outStream.toByteArray();
    }
}
