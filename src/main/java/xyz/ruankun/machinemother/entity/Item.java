package xyz.ruankun.machinemother.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "mm_item")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "productid")
    private Integer productId;
    @Column(name = "productpropsid")
    private Integer productPropsId;  //由producttypeid改为 productPropsId

    private Integer quantity;
    @Column(name = "orderid")
    private String orderId; //注意一下这里的orderid不是order的id，是ordernumber，设计缺陷，不想改了
    private Date gmtCreate;
    private Date gmtModified;
    @Column(name = "userid")
    private Integer userId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getProductPropsId() {
        return productPropsId;
    }

    public void setProductPropsId(Integer productTypeId) {
        this.productPropsId = productTypeId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
