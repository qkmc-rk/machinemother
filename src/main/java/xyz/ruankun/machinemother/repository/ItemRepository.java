package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import xyz.ruankun.machinemother.entity.Item;

import java.math.BigDecimal;
import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Integer> {
    List<Item> findAllByOrderNumber(String orderNumber);

    List<Item> findByUserId(Integer userId);

    List<Item> findByUserIdAndOrderNumber(int userId, String orderNumber);

    List<Item> findByUserIdAndOrderNumberIsNull(int userId);

    Item findById(int id);

    Item findByUserIdAndProductId(int userId, int productId);

    int  deleteByUserId(Integer userId);

    int deleteById(int id);

}
