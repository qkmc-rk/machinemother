package xyz.ruankun.machinemother.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    Order findByIdAndIsDelete(int id, Boolean isDelete);

    List<Order> findByIsDelete(Boolean isDelete);

    Order findByOrderNumberAndIsDelete(String orderNumber, Boolean isDelete);

    List<Order> findByUserIdAndIsDelete(int userId, Boolean isDelete);

    List<Order> findAllByIsDelete(Boolean isDelete);

//    @Modifying
//    @Transactional
//    @Query(value = "delete from mm_order where id=?1", nativeQuery = true)
//    Integer deleteById(int id);

//    @Query(value = "delete from mm_order where userid=?1", nativeQuery = true)
//    @Modifying
//    @Transactional
//    Integer deleteByUserId(int userId);
}
