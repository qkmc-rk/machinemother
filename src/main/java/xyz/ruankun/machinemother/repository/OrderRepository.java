package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    Order findById(int id);

    Order findByOrderNumber(String orderNumber);

    List<Order> findByUserId(int userId);

    @Modifying
    @Transactional
    @Query(value = "delete from mm_order where id=?1", nativeQuery = true)
    Integer deleteById(int id);

    @Query(value = "delete from mm_order where userid=?1", nativeQuery = true)
    @Modifying
    @Transactional
    Integer deleteByUserId(int userId);
}
