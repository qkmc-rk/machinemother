package xyz.ruankun.machinemother.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import xyz.ruankun.machinemother.entity.Item;
import xyz.ruankun.machinemother.entity.Order;
import xyz.ruankun.machinemother.entity.OrderSecret;

import java.util.List;
import java.util.Map;

public interface EconService {

    //order
    Order addOrder(int userId, int decouponId, Boolean useCredit, Integer credit, Integer addrId);

    Order getOrder(int id);

    Order getOrder(String orderNumber);

    Integer cancelOrder(Integer userId, Integer OrderId);

    List<Order> getOrders(int userId);

    List<Order> getOrders(Pageable pageable);

    List<Order> getOrders(Integer page, Integer limit);

    Integer deleteOrder(Integer id);

    Boolean deleteOrders(int userId);

    Map<String, Object> getDetail(String ordernumber);

    //item
    Item getItem(int id);

    Item getItem(int userId, int productId);

    List<Item> getItems(int userId);

    List<Item> getItemsUsed(int userId, String orderNumber);

    List<Item> getItemsFree(int userId);

    Boolean addItem(Item item);

    Boolean updateItem(Item item);

    Integer deleteItem(int id);

    Boolean deleteItems(int userId);

    // secret
    OrderSecret getSecretById(int id);

    OrderSecret getSecretByOrder( int orderId);

    Boolean confirmOrder(String orderSecret, String employee, Integer orderId);
}
