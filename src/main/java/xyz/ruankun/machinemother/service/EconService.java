package xyz.ruankun.machinemother.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import xyz.ruankun.machinemother.entity.Item;
import xyz.ruankun.machinemother.entity.Order;
import xyz.ruankun.machinemother.entity.OrderSecret;

import java.math.BigDecimal;
import java.util.List;

public interface EconService {

    //order
    Order addOrder(int userId, int decouponId, Boolean useCredit, Integer credit, Integer addrId);

    Order getOrder(int id);

    Order getOrder(String orderNumber);

    List<Order> getOrders(int userId);

    Page<Order> getOrders(Pageable pageable);

    Boolean deleteOrder(int id);

    Boolean deleteOrders(int userId);


    //item
    Item getItem(int id);

    Item getItem(int userId, int productId);

    List<Item> getItems(int userId);

    List<Item> getItemsUsed(int userId, String orderNumber);

    List<Item> getItemsFree(int userId);

    Boolean addItem(Item item);

    Boolean updateItem(Item item);

    Boolean deleteItem(int id);

    Boolean deleteItems(int userId);

    // secret
    OrderSecret getSecretById(int id);

    OrderSecret getSecretByOrder( int orderId);

}
