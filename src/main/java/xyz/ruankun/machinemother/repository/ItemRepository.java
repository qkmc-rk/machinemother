package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Item;

import java.math.BigDecimal;
import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Integer> {
    List<Item> findAllByOrderNumber(String orderNumber);

    List<Item> findAllByProductId(Integer productId);

    Integer countByProductIdIsAndOrderNumberIsNotNull(Integer productId);

    List<Item> findByUserId(Integer userId);

    List<Item> findByUserIdAndOrderNumber(int userId, String orderNumber);

    List<Item> findByUserIdAndOrderNumberIsNull(int userId);

    Item findById(int id);

    Item findByUserIdAndProductId(int userId, int productId);

    List<Item> findByProductId(int productId);

    @Transactional
    @Query(value = "delete from mm_item where userid=?1", nativeQuery = true)
    @Modifying
    Integer deleteByUserId(Integer userId);

    @Query(value = "delete from mm_item where id=?1", nativeQuery = true)
    @Transactional
    @Modifying
    Integer deleteById(int id);

}
