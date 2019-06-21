package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Item;

import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Integer> {
    List<Item> findAllByOrderId(String orderid);

    /**
     * 新的购物车物品
     * @param userId
     * @return
     */
    List<Item> findAllByUserIdAndOrderIdIsNull(Integer userId);
}
