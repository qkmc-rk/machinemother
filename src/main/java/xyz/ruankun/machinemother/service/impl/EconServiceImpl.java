package xyz.ruankun.machinemother.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.annotation.小坏蛋;
import xyz.ruankun.machinemother.entity.*;
import xyz.ruankun.machinemother.repository.*;
import xyz.ruankun.machinemother.service.EconService;
import xyz.ruankun.machinemother.service.UserInfoService;
import xyz.ruankun.machinemother.util.DataCode;
import xyz.ruankun.machinemother.util.MD5Util;
import xyz.ruankun.machinemother.util.constant.OrderIndentStatus;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.*;

@Service
public class EconServiceImpl implements EconService {

    @Resource
    private OrderRepository orderRepository;

    @Resource
    private ItemRepository itemRepository;

    @Resource
    private OrderSecretRepository orderSecretRepository;

    @Resource
    private DecouponRepository decouponRepository;

    @Resource
    private ProductRepository productRepository;

    @Resource
    private CreditRecordRepository creditRecordRepository;

    @Resource
    private ProductPropsRepository productPropsRepository;

    @Autowired
    private CommentRepository commentRepository;

    /**
     * 没用 7.12
     *
     * @param userId
     * @param decouponId
     * @param useCredit
     * @param credit
     * @param addrId
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Order addOrder(int userId, int decouponId, Boolean useCredit, Integer credit, Integer addrId) {
        Order order = new Order();
        order.setIsCancle(false);
        order.setIsDelete(false);
        BigDecimal youhui = new BigDecimal(0);     //优惠额度
        //如果使用优惠券且优惠券存在
        if (decouponId > 0) {
            Decoupon decoupon = decouponRepository.findById(decouponId);
            if (decoupon != null && !decoupon.getPast() && !decoupon.getUsed()) {
                //将优惠券标记为使用状态
                decoupon.setUsed(true);
                youhui = decoupon.getWorth();
                decouponRepository.save(decoupon);//若是最终order未完成，则需将优惠券状态重新置回。若当时已过期则另行判断

                //设置order中与decoupon相关的属性
                order.setDecouponId(decouponId);
                order.setUseDecoupon(true);
                order.setCredit(new BigDecimal(0));
                order.setUseCredit(false);
            } else {
                //decoupon状态异常则返回null;
                return null;
            }
            //todo 是否可以同时使用积分和优惠券的问题
        } else if (useCredit) {
            CreditRecord creditRecord = new CreditRecord();
            creditRecord.setAmount(credit);
            creditRecord.setGmtCreate(new Date());
            creditRecord.setSave(false);        //带完成order后修改为true；
            creditRecord.setUserId(userId);
            creditRecordRepository.save(creditRecord);
            youhui = new BigDecimal(creditRecord.getAmount() / 100);

            //设置order与credit相关属性
            order.setUseCredit(true);
            order.setCredit(new BigDecimal(credit));
            order.setUseDecoupon(false);
            order.setDecouponId(0);
        }

        //获取items计算总金额
        order.setOrderNumber(generateNumber());

        List<Item> items = getItemsFree(userId);
        BigDecimal amount = new BigDecimal(0);
        for (Item item : items) {
            ProductProps productProps = productPropsRepository.findById(item.getProductPropsId().intValue());
            if (productProps == null) {
                throw new RuntimeException("没有productProps相关信息");
            } else {
                amount.add(productProps.getPrice());
                item.setOrderNumber(order.getOrderNumber());
            }
        }
        order.setAmount(amount.subtract(youhui));
        if (order.getAmount().doubleValue() < 0) {
            order.setAmount(new BigDecimal(0));
        }
        order.setIsPaid(false);
        order.setIsFinished(false);
        order.setGmtModified(new Date());
        order.setGmtCreate(new Date());
        order.setAddrId(addrId);
        order.setUserId(userId);
        orderRepository.save(order);
        //设置ordersecret
        OrderSecret orderSecret = new OrderSecret();
        orderSecret.setGmtCreate(new Date());
        orderSecret.setGmtModified(new Date());
        orderSecret.setOrderid(order.getId());
        orderSecret.setUsed(false);
        orderSecret.setUserId(userId);
        orderSecretRepository.save(orderSecret);
        itemRepository.saveAll(items);
        return order;
    }

    /**
     * 只取未删除数据
     *
     * @param id
     * @return
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public Order getOrder(int id) {
        try {
            Order order = orderRepository.findByIdAndIsDelete(id, false);
            if (order == null) {
                order = new Order();
                order.setId(0);
            }
            return setOrderOfCommentProductPropsProductInfo(order);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public Order getOrder(String orderNumber) {
        try {
            Order order = orderRepository.findByOrderNumberAndIsDelete(orderNumber, false);
            if (order == null) {
                order = new Order();
                order.setId(0);
            }
            return order;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Transactional
    @Override
    public Integer cancelOrder(Integer userId, Integer OrderId) {
        Order order = getOrder(OrderId);
        if (order.getId() != 0) {
            if (userId.equals(order.getUserId())) {
                if (!order.getIsCancle() || !order.getIsPaid()) {
                    order.setIsCancle(true);
                    return DataCode.DATA_OPERATION_SUCCESS;
                }
            }
            return DataCode.DATA_OPERATION_FAILURE;
        } else {
            return DataCode.DATA_CONFLIC;
        }
    }

    @Override
    public List<Order> getOrders(int userId) {
        List<Order> orders = orderRepository.findByUserIdAndIsDelete(userId, false);
        if (orders == null) return null;
        List<Order> orders1 = new ArrayList<>();
        for (Order order :
                orders) {
            orders1.add(setOrderOfCommentProductPropsProductInfo(order));
        }
        return orders1;
    }

    @Override
    public Page<Order> getOrders(Pageable pageable) {
        Page<Order> orders = orderRepository.findAll(pageable);
        return orders;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer deleteOrder(Integer id) {
        Order order = getOrder(id);
        if (order.getId() != 0) {
            order.setIsDelete(true);
            orderRepository.save(order);
            return DataCode.DATA_OPERATION_SUCCESS;
        } else {
            return DataCode.DATA_CONFLIC;
        }
    }

    @Override
    @Transactional
    public Boolean deleteOrders(int userId) {
        List<Order> order = getOrders(userId);
        if (order == null) {
            return false;
        } else {
            for (Order order1 : order) {
                order1.setIsDelete(true);
                orderRepository.save(order1);
            }
            return true;
        }
    }

    @Override
    public Map<String, Object> getDetail(String ordernumber) {
        Map<String, Object> map = new LinkedHashMap<>();
        List<Item> items = itemRepository.findAllByOrderNumber(ordernumber);
        Set<Product> products = new HashSet<>();
        int count = 0;
        if (items.size() > 0) {
            for (Item item : items) {
                try {
                    Product product = productRepository.findById(item.getProductId().intValue());
                    if (product != null) {
                        count += 1;
                        products.add(product);
                    } else {
                        map.put("error", "数据错误");
                        return map;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("item  id:" + item.getId() + "对应的product不存在");
                    map.put("error", "数据错误");
                    return map;
                }
            }
//            添加一一对应关系
            if (count == items.size()) {
                map.put("product", products);
                map.put("item", items);
            } else {
                map.put("error", "数据错误");
            }
        } else {
            map.put("error", "数据错误");
        }
        return map;
    }

    @Override
    public Item getItem(int id) {
        try {
            Item item = itemRepository.findById(id);
            if (item == null) {
                item = new Item();
                item.setId(0);
            }
            return item;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public Item getItem(int userId, int productId) {
        try {
            Item item = itemRepository.findByUserIdAndProductId(userId, productId);
            if (item == null) {
                item = new Item();
                item.setId(0);
            }
            return item;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Item> getItems(int userId) {
        return itemRepository.findByUserId(userId);
    }

    @Override
    public Boolean addItem(Item item) {
        try {
            itemRepository.save(item);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean updateItem(Item item) {
        Item check = getItem(item.getId());
        if (check == null || check.getId() == 0) {
            return false;
        } else {
            try {
                itemRepository.save(item);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
    }

    @Override
    @Transactional
    public Integer deleteItem(int id) {
        Integer result = itemRepository.deleteById(id);
        if (result <= 0) {
            return DataCode.DATA_OPERATION_FAILURE;
        } else {
            return DataCode.DATA_OPERATION_SUCCESS;
        }
    }

    @Override
    public Boolean deleteItems(int userId) {
        Integer result = itemRepository.deleteByUserId(userId);
        if (result <= 0) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public OrderSecret getSecretById(int id) {
        try {
            OrderSecret orderSecret = orderSecretRepository.findById(id);
            if (orderSecret == null) {
                orderSecret = new OrderSecret();
                orderSecret.setId(0);
            }
            return orderSecret;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public OrderSecret getSecretByOrder(int orderId) {
        try {
            OrderSecret orderSecret = orderSecretRepository.findByOrderid(orderId);
            if (orderSecret == null) {
                orderSecret = new OrderSecret();
                orderSecret.setId(0);
            }
            return orderSecret;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 这是一个事务级的操作
     *
     * @param orderSecret
     * @param orderId
     * @return
     */
    @Override
    @Transactional
    public Boolean confirmOrder(String orderSecret, String employee, Integer orderId) {

        OrderSecret orderSecret1 = null;
        try {
            orderSecret1 = getSecretByOrder(orderId);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        if (orderSecret1.getSecret().equals(orderSecret)) {
            orderSecret1.setUsed(true);
            orderSecret1.setEmployee(employee);
            Order order = null;
            try {
                order = getOrder(orderId);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            //order 已付款，未完成，未取消
            if (order.getIsPaid() && !order.getIsCancle() && !order.getIsFinished()) {
                //事务
                order.setIsFinished(true);//完成订单
                orderRepository.saveAndFlush(order);
                orderSecretRepository.saveAndFlush(orderSecret1);
                return true;
            } else {
                return false;
            }
        } else
            return false;
    }

    @Override
    public List<Item> getItemsUsed(int userId, String orderNumber) {
        return itemRepository.findByUserIdAndOrderNumber(userId, orderNumber);
    }

    @Override
    public List<Item> getItemsFree(int userId) {
        return itemRepository.findByUserIdAndOrderNumberIsNull(userId);
    }
//    private void add(User user){
//        userInfoService.save(user);
//        throw new RuntimeException("sdfadaf");
//    }

//    private void additem(Item item){
//        itemRepository.save(item);
//        throw new RuntimeException("item");
//    }

//    private void addOer(Order order){
//        orderRepository.save(order);
//        throw new RuntimeException("order");
//    }

    private String generateNumber() {
        long time = new Date().getTime();   //当前时间作为加密种子
        return MD5Util.md5(String.valueOf(time));
    }

    /**
     * 丰富一下order的内容
     *
     * @param order
     * @return
     */
    @小坏蛋(真的吗 = true)
    private Order setOrderOfCommentProductPropsProductInfo(Order order) {
        if (order == null) {
            System.out.println("传入的order为空，不能为order设置comment product等相关信息");
            return null;
        }
        //第一步，设置indentStatus
        Boolean paid = order.getIsPaid();
        Boolean finished = order.getIsFinished();
        Boolean cancle = order.getIsCancle();       //不知道是什么但还是加一个
        if (paid && finished) {
            //已完成
            order.setIndentStatus(OrderIndentStatus.FINISHED);
        } else if (!paid.booleanValue()) {
            //未支付
            order.setIndentStatus(OrderIndentStatus.NOT_PAY);
        } else if (paid.booleanValue() && !finished.booleanValue()) {
            //已支付
            order.setIndentStatus(OrderIndentStatus.PAYED);
        } else if (!paid.booleanValue() && !finished.booleanValue()) {
            //未支付
            order.setIndentStatus(OrderIndentStatus.NOT_PAY);
        }
        //第二步，找到items，并为每个item设置comment,productInfo,productPropsInfo
        List<Item> items = itemRepository.findByUserIdAndOrderNumber(order.getUserId(), order.getOrderNumber());
        for (Item item :
                items) {
            //设置每个item的Comment,productInfo,productPropsInfo
            List<Comment> comments = commentRepository.findByItemId(item.getId());
            Product product = null;
            ProductProps productProps = null;
            try {
                product = productRepository.findById(item.getProductId().intValue());
                productProps = productPropsRepository.findById(item.getProductPropsId().intValue());

                item.setProduct(product);
                if (!comments.isEmpty())
                    item.setCommentInfo(comments.get(0));
                item.setProductProps(productProps);
            } catch (Exception e) {
                System.out.println("无相关product信息或者相关productProps信息");
                Product product1 = new Product();
                ProductProps productProps1 = new ProductProps();
                productProps1.setServiceTime("没有找到任何相关product信息或者productProps信息");
                product1.setContent("没有找到任何相关product信息或者productProps信息");
                item.setProduct(product1);
                e.printStackTrace();
            }
        }
        //xx
        //第三步，设置order的items信息
        order.setItems(items);
        return order;
    }
}
