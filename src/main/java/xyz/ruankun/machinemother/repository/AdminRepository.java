package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, Integer> {

    /**
     * 通过管理员的账号和密码找到该管理员用户并返回
     * @param account
     * @param password
     * @return
     */
    Admin findByAccountAndPassword(String account,String password);

}
