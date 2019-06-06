package xyz.ruankun.machinemother.service;

/**
 * 接口中定义与管理员本身操作相关的方法
 */
public interface AdminService {

    /**
     * 管理员登录，详细注释请参考impl类
     * @param account
     * @param password
     * @return
     */
    Integer adminLogin(String account,String password);
}
