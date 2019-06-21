package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.OrderSecret;

import java.util.List;

public interface OrderSecretRepository extends JpaRepository<OrderSecret, Integer> {
    List<OrderSecret> findAllByUserId(Integer userid);

    OrderSecret findByUserIdAndOrderid(Integer userid, Integer orderid);

    OrderSecret findByUserId(Integer userId);

    OrderSecret findByOrderid(Integer orderId);

    int deleteByOrderid(int orderid);

    int deleteByUserId(int userId);
}
