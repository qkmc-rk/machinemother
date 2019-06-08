package xyz.ruankun.machinemother.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.repository.AdminRepository;
import xyz.ruankun.machinemother.repository.UserRepository;
import xyz.ruankun.machinemother.service.AdminService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import javax.servlet.http.HttpServletRequest;

/**
 * 使用aop完成API请求时的认证和权限
 * made by Jason. Completed by mrruan
 */
@Aspect
@Component
public class AuthenticationAspect {

    public final static Logger logger = LoggerFactory.getLogger(AuthenticationAspect.class);

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private AdminService adminService;

    //去数据库查询权限
    @Autowired
    AdminRepository adminRepository;

    @Autowired
    UserRepository userRepository;

    @Pointcut(value = "@annotation(xyz.ruankun.machinemother.annotation.Authentication)")
    public void pointcut() {}

    /**
     * 与被注释方法正确返回之后执行
     * @param joinPoint 方法执行前的参数
     * @param result 方法返回值 后续观察，是否保存
     */
    @AfterReturning(returning = "result", value = "@annotation(xyz.ruankun.machinemother.annotation.Authentication)")
    public void after(JoinPoint joinPoint, Object result) {
        logger.info("refreshing token");
        Object[] args = joinPoint.getArgs();
        for (Object arg : args) {
            if (arg instanceof HttpServletRequest) {
                HttpServletRequest request = (HttpServletRequest) arg;
                String token = request.getParameter("token");
                if (token != null) {
                    //通过token获取id值更新token有效期
                    int userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
                    String sessionKey = userInfoService.readDataFromRedis("session_key" + userId);
                    if (null == sessionKey){
                        //管理员是没有sessionkey的哟
                        adminService.updateSession(String.valueOf(userId),token,15);
                    }else
                        userInfoService.updateSession(userId,sessionKey, token,15);
                    logger.info("refreshed token");
                }else{
                    logger.info("not refreshed token");
                }
            }
        }

    }
    @Around("pointcut() && @annotation(authentication)")
    public  Object interceptor(ProceedingJoinPoint proceedingJoinPoint, Authentication authentication){

        boolean pass = authentication.pass();
        //要验证权限
        AuthAopConstant role = authentication.role();
        if(pass && role != AuthAopConstant.ANON){
            //通过拿到的role,我们可以知道能处理这个请求的角色是什么
            //如果是匿名者，直接放行，如果是用户，就需要用户的权限才行，管理员则需要管理员的角色才行
            //规定一致，token放在header中
            HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder
                    .getRequestAttributes()).getRequest();
            String token = request.getHeader("token");
            AuthAopConstant realRole = authenticate(token);
            if (realRole == role) {
                //权限正确，去访问吧
                try {
                    return proceedingJoinPoint.proceed();
                } catch (Throwable throwable) {
                    throwable.printStackTrace();
                    ResponseEntity responseEntity = new ResponseEntity();
                    responseEntity.success(Constant.AOP_SERVER_ERROR, "", null);
                    return responseEntity;
                }
            }else{
                //权限错误，返回错误
                ResponseEntity responseEntity = new ResponseEntity();
                responseEntity.success(Constant.AUTH_ERROR, "permission denied,forbidden access", null);
                return responseEntity;
            }
        }else{
            //不验证权限
            try {
                return proceedingJoinPoint.proceed();
            } catch (Throwable throwable) {
                throwable.printStackTrace();
                ResponseEntity responseEntity = new ResponseEntity();
                responseEntity.success(Constant.AOP_SERVER_ERROR, "", null);
                return responseEntity;
            }
        }
    }

    /**
     * 这个方法用于判断该token所属的到底是谁(管理员？ 用户？ 匿名？)
     * @param token
     * @return
     */
    private AuthAopConstant authenticate(String token){
        String userId = null;
        try {
            userId = userInfoService.readDataFromRedis(token);
        } catch (Exception e) {
            e.printStackTrace();
            //读取userId错误(最大的可能是请求的header中没有token)，直接返回匿名错误
            return  AuthAopConstant.ANON;
        }
        if(userId == null){
            //匿名的或者说用户过期的，没有找到session
            return AuthAopConstant.ANON;
        }else{
            Integer id;
            try {
                id = Integer.parseInt(userId);
                logger.info("userId:" + id);
            } catch (Exception e) {
                e.printStackTrace();
                //都抛出了异常了，这个userId是假的，直接匿名者
                return AuthAopConstant.ANON;
            }
            if(adminRepository.findById(id).isPresent()){
                //是管理员
                return AuthAopConstant.ADMIN;
            }else{
                if (userRepository.findById(id).isPresent()){
                    //是用户
                    return AuthAopConstant.USER;
                }else{
                    //没有发现它是用户，假的
                   return AuthAopConstant.ANON;
                }
            }
        }
    }
}
