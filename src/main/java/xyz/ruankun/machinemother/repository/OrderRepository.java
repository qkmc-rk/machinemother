package xyz.ruankun.machinemother.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import xyz.ruankun.machinemother.entity.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {

    Order findById(int id);
    Page<Order> findAllByIsDelete(Boolean isDelete, Pageable pageable);

    Order findByIdAndIsDelete(int id, Boolean isDelete);

    List<Order> findByIsDelete(Boolean isDelete);

    Order findByOrderNumberAndIsDelete(String orderNumber, Boolean isDelete);

    int countAllByIsDelete(Boolean isDelete);

    List<Order> findByUserIdAndIsDelete(int userId, Boolean isDelete);

    List<Order> findAllByIsDelete(Boolean isDelete);

//    @Query(value = "select mm_order.id, mm_order.userid, mm_order.ordernumber," +
//            " mm_order.amount, mm_order.gmt_modified , " +
//            "mm_order.gmt_create, mm_order.is_paid , " +
//            "mm_order.is_finished, mm_order.decouponid , " +
//            "mm_order.is_usedecoupon ,mm_order.credit ," +
//            " mm_order.is_usecredit ,mm_order.addr_id , " +
//            "mm_order.is_delete, mm_order.is_cancle, " +
//            "mm_item.id, mm_item.productid," +
//            "mm_item.productpropsid, mm_item.quantity, mm_item.orderid," +
//            "mm_item.userid, mm_item.gmt_create, mm_item.gmt_modified," +
//            "mm_item.is_comment " +
//            "from mm_order, mm_item where mm_order.id=?1 and mm_item.orderid=mm_order.ordernumber ",
//            nativeQuery = true)
    Order getById(@Param(value = "id") int id);

    @Query(value = "select id, userid, ordernumber, amount, gmt_create, gmt_modified, is_paid, is_finished, decouponid, is_usedecoupon, credit, is_usecredit, addr_id, is_delete, is_cancle from mm_order where id=?1", nativeQuery = true)
    Order getId(Integer id);

//    @Query(value = "select id, orderNumber from mm_order where id=?1")
//    Order getAllById(Integer id);

//    @Modifying
//    @Transactional
//    @Query(value = "delete from mm_order where id=?1", nativeQuery = true)
//    Integer deleteById(int id);

//    @Query(value = "delete from mm_order where userid=?1", nativeQuery = true)
//    @Modifying
//    @Transactional
//    Integer deleteByUserId(int userId);
}
