package xyz.ruankun.machinemother.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import xyz.ruankun.machinemother.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    private final Logger logger = LoggerFactory.getLogger(UserInfoServiceImpl.class);

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private RestTemplate restTemplate;

    @Value("${weixin.secret}")
    private String SECRET;
    @Value("${weixin.appid}")
    private String APPID;
    @Value("${weixin.api}")
    private String API;

    @Value("${weixin.api.code_start}")
    private Integer code_start;
    @Value("${weixin.api.code_end}")
    private Integer code_end;

    @Value("${weixin.api.secret_start}")
    private Integer secret_start;
    @Value("${weixin.api.secret_end}")
    private Integer secret_end;

    @Value("${weixin.api.appid_start}")
    private Integer appid_start;
    @Value("${weixin.api.appid_end}")
    private Integer appid_end;

    @Override
    public Integer login(String code) {
        StringBuilder uri = new StringBuilder();
        uri.append(API);
        //替换CODE
        uri.replace(code_start,code_end,code);
        //替换SECRET
        uri.replace(secret_start,secret_end,SECRET);
        //替换APPID
        uri.replace(appid_start,appid_end,APPID);
        String uriStr = uri.toString();
        logger.info(uriStr);
        String strBody = getBody(restTemplate,uriStr);
        logger.info(strBody);
        return null;
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
}
