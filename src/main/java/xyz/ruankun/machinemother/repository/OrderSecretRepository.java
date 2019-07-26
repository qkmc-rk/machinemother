package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.OrderSecret;

import java.util.List;

public interface OrderSecretRepository extends JpaRepository<OrderSecret, Integer> {
    List<OrderSecret> findAllByUserId(Integer userid);

    OrderSecret findByUserIdAndOrderid(Integer userid, Integer orderid);

    OrderSecret findByUserId(Integer userId);

    OrderSecret findByOrderid(Integer orderId);

    OrderSecret findById(int id);

    @Query(value = "delete from mm_ordersecret where orderid=?1", nativeQuery = true)
    @Modifying
    @Transactional
    Integer deleteByOrderid(int orderid);

    @Query(value = "delete form mm_ordersecret where userid=?1", nativeQuery = true)
    @Modifying
    @Transactional
    Integer deleteByUserId(int userId);


    @Query(value = "delete from mm_ordersecret where id=?1", nativeQuery = true)
    @Modifying
    @Transactional
    Integer deleteById(int id);
}
