package xyz.ruankun.machinemother.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import xyz.ruankun.machinemother.service.UserInfoService;

import javax.servlet.http.HttpServletRequest;

@Aspect
public class AuthenticationAspect {

    @Autowired
    private UserInfoService userInfoService;

    @Pointcut(value = "@annotation(xyz.ruankun.machinemother.annotation.Authentication)")
    public void pointcut() {}

    /**
     * 与被注释方法正确返回之后执行
     * @param joinPoint 方法执行前的参数
     * @param result 方法返回值 后续观察，是否保存
     */
    @AfterReturning(returning = "result", value = "@annotation(xyz.ruankun.machinemother.annotation.Authentication)")
    public void after(JoinPoint joinPoint, Object result) {

        Object[] args = joinPoint.getArgs();
        for (Object arg : args) {
            if (arg instanceof HttpServletRequest) {
                HttpServletRequest request = (HttpServletRequest) arg;
                String token = request.getParameter("token");
                if (token != null) {
                    //通过token获取id值更新token有效期
                    int userId = Integer.valueOf(userInfoService.readDataFromRedis(token));
                    String sessionKey = userInfoService.readDataFromRedis("session_key" + userId);
                    userInfoService.updateSession(userId,sessionKey, token,15);
                }
            }
        }

    }
}
