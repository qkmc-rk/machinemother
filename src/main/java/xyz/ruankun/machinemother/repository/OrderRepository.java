package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    Order findByOrderNumber(String orderNumber);

    List<Order> findByUserId(int userId);

    int deleteById(int id);

    int deleteByUserId(int userId);
}
