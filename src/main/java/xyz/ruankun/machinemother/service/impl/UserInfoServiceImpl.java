package xyz.ruankun.machinemother.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import xyz.ruankun.machinemother.entity.User;
import xyz.ruankun.machinemother.entity.Wallet;
import xyz.ruankun.machinemother.repository.UserRepository;
import xyz.ruankun.machinemother.repository.WalletRepository;
import xyz.ruankun.machinemother.service.FinancialService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.DataCode;
import xyz.ruankun.machinemother.util.EntityUtil;
import xyz.ruankun.machinemother.util.MD5Util;
import xyz.ruankun.machinemother.vo.weixin.WxServerResult;

import javax.annotation.Resource;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    private final Logger logger = LoggerFactory.getLogger(UserInfoServiceImpl.class);

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private RestTemplate restTemplate;

    @Resource
    private UserRepository userRepository;

    @Autowired
    WalletRepository walletRepository;

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


    /**
     * 调用登录服务返回四种状态，
     * 登录成功，  （返回用户ID）
     * 因code错误登录失败，
     * 因code已被使用登录失败，
     * 因用户未注册登录失败
     * ↑ 以上四种状态在常量Constant中定义
     *
     * @param code
     * @return Constant.xxx 详情参照Constant中的常量
     */
    @Override
    public Integer login(String code) {
        WxServerResult wxServerResult =
                requestWxServerWithCode(code);
        Integer errCode = wxServerResult.getErrcode();
        if (null != errCode) {
            if (errCode.equals(Constant.WX_ERROR_CODE)) return Constant.LOGIN_CODE_ERROR;
            if (errCode.equals(Constant.WX_USED_CODE)) return Constant.LOGIN_CODE_USED;
        }
        //没有返回错误码则说明返回了session_key和openid
        User user = userRepository.findByOpenId(wxServerResult.getOpenid());
        if (null == user) return Constant.LOGIN_NO_USER;
        else {
            //成功后还要缓存session_key和token
            String token = MD5Util.md5(new Date().toString());
            String session_key = wxServerResult.getSession_key();
            if (updateSession(user.getId(), session_key, token, 15))
                return user.getId();
            return Constant.LOGIN_SERVER_ERROR;
        }
    }

    /**
     * @param userId
     * @param session_key 从微信服务器拿到的session_key
     * @param token       系统随机生成的token
     * @param period      有效时间 分钟
     * @return 存入缓存后返回成功
     */
    @Override
    public Boolean updateSession(Integer userId, String session_key, String token, Integer period) {
        //要存入redis的数据有四条：
        //既可以通过userid找到token和session_key又可以反过来通过这两个找userId
        setDataToRedis("token" + userId, token, period);
        setDataToRedis(token, String.valueOf(userId), period);
        setDataToRedis("session_key" + userId, session_key, period);
        setDataToRedis(session_key, String.valueOf(userId), period);
        return true;
    }

    @Override
    public String readDataFromRedis(String key) {
        ValueOperations<String, String> valueOperations = stringRedisTemplate.opsForValue();
        return valueOperations.get(key);
    }

    @Override
    public void setDataToRedis(String key, String value, Integer min) {
        ValueOperations<String, String> valueOperations = stringRedisTemplate.opsForValue();
        valueOperations.set(key, value, min, TimeUnit.MINUTES);
    }

    @Override
    @Transactional
    public Integer register(String code, User user) {
        WxServerResult wxServerResult = requestWxServerWithCode(code);
        if (wxServerResult.getErrcode() != null && wxServerResult.getErrcode().equals(Constant.WX_ERROR_CODE))
            return Constant.REGISTER_CODE_ERROR;
        if (wxServerResult.getErrcode() != null && wxServerResult.getErrcode().equals(Constant.WX_USED_CODE))
            return Constant.REGISTER_CODE_USED;

        logger.info("注册：错误代码{}", wxServerResult.getErrcode());
        logger.info("注册：openid{}", wxServerResult.getOpenid());
        //拉取用户的session_key和openid成功
        //检验是否注册过
        User dbRow = userRepository.findByOpenId(wxServerResult.getOpenid());
        if (dbRow != null) return Constant.REGISTER_ALREADY_DOWN;//早已注册过
        //正式进行注册
        user.setOpenId(wxServerResult.getOpenid());
        User rs = userRepository.save(user);
        if (rs != null) {
            //注册成功，生成钱包信息，将用户信息写入redis，然后直接返回用户的ID
            Wallet wallet = new Wallet();
            wallet.setGmtModified(new Date());
            wallet.setCredit(0);
            wallet.setCommission(new BigDecimal(0));
            wallet.setUserId(rs.getId());
            //保存wallet
            try {
                walletRepository.save(wallet);
            } catch (Exception e) {
                e.printStackTrace();
                userRepository.deleteById(rs.getId());
                return Constant.REGISTER_SERVER_ERROR;
            }

            String token = MD5Util.md5(new Date().toString());
            String session_key = wxServerResult.getSession_key();
            if (updateSession(user.getId(), session_key, token, 15))
                return user.getId();
            return Constant.LOGIN_SERVER_ERROR;
        }
        return Constant.REGISTER_SERVER_ERROR;
    }

    /**
     * 封装了请求微信服务端的代码，传入code，请求后，将结果封装成为一个WxServerResult对象返回
     *
     * @param code
     * @return 微信服务器请求的结果
     */
    private WxServerResult requestWxServerWithCode(String code) {
        StringBuilder uri = new StringBuilder();
        uri.append(API);
        //替换CODE
        uri.replace(code_start, code_end, code);
        //替换SECRET
        uri.replace(secret_start, secret_end, SECRET);
        //替换APPID
        uri.replace(appid_start, appid_end, APPID);
        String uriStr = uri.toString();
        logger.info(uriStr);
        String strBody = getBody(restTemplate, uriStr);
        logger.info(strBody);
        //到数据库查询是否存在openId为某一值的记录
        ObjectMapper objectMapper = new ObjectMapper();
        WxServerResult wxServerResult = null;
        try {
            wxServerResult = objectMapper.readValue(strBody, WxServerResult.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return wxServerResult;
    }

    /**
     * 该方法发送简单的get请求，并获取相应数据
     *
     * @param restTemplate
     * @param uri
     * @return 服务器响应数据
     */
    private String getBody(RestTemplate restTemplate, String uri) {
        ResponseEntity<String> responseEntity = restTemplate.getForEntity(uri, String.class);
        if (responseEntity.getStatusCodeValue() == 200)
            return responseEntity.getBody();
        return null;
    }

    @Override
    public User getUser(String openId) {
        try {
            User user = userRepository.findByOpenId(openId);
            if (user == null) {
                user = new User();
                user.setId(0);
            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public User getUser(Integer userId) {
        try {
            User user = userRepository.findById(userId.intValue());
            if (user == null) {
                user = new User();
                user.setId(0);
            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<User> getUsers(Integer userId) {
        return userRepository.findByInvitorId(userId);
    }

    @Override
    public User getByWxId(String wxId) {
        try {
            User user = userRepository.findByWxId(wxId);
            if (user == null) {
                user = new User();
                user.setId(0);
            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public User getByPhone(String phone) {
        try {
            User user = userRepository.findByPhone(phone);
            if (user == null) {
                user = new User();
                user.setId(0);
            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Page<User> getAll(Pageable pageable) {
        return userRepository.findAll(pageable);
    }

    @Override
    public Page<User> getByInvitor(int invitorId, Pageable pageable) {
        return userRepository.findByInvitorId(invitorId, pageable);
    }

    @Override
    public Page<User> search(String name, Pageable pageable) {
        name = "%" + name + "%";
        return userRepository.findByNameLike(name, pageable);
    }

    @Override
    public Integer delete(String openId) {
        Integer result = userRepository.deleteByOpenId(openId);
        if (result < 0) {
            return DataCode.DATA_OPERATION_FAILURE;
        } else {
            return DataCode.DATA_OPERATION_SUCCESS;
        }
    }

    @Override
    public Integer delete(Integer userId) {
        User user = getUser(userId);
        if (user == null || user.getId() == 0)
            return DataCode.DATA_CONFLIC;
        try {
            Integer result = userRepository.deleteById(userId.intValue());
            if (result < 0) {
                return DataCode.DATA_OPERATION_FAILURE;
            } else {
                return DataCode.DATA_OPERATION_SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return DataCode.DATA_OPERATION_ERROR;
        }
    }

    @Override
    @Transactional
    public User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public User update(User user) {
        logger.info("要修改的user的参数：" + user.toString());
        User check = getUser(user.getId());
        if (check == null || check.getId() == 0) {
            return null;
        } else {
            EntityUtil.update(user, check);
            logger.info("修改后的user的参数：" + user.toString());
            user.setGmtModified(new Date());
            System.out.println(" ????? " + user);
            return userRepository.save(user);
        }
    }

}
