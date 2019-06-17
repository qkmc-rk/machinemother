package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    Order findByOrderNumber(String orderNumber);

}
