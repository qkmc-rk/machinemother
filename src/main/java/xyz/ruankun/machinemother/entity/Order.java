package xyz.ruankun.machinemother.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "mm_order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "userid")
    private Integer userId;
    @Column(name = "ordernumber")
    private String orderNumber;
    private BigDecimal amount;
    private Date gmtCreate;
    private Date gmtModified;
    private Boolean isPaid;
    private Boolean isFinished;

    //添加
    @Column(name = "is_usedecoupon")
    private Boolean isUseDecoupon;
    @Column(name = "is_usecredit")
    private Boolean isUseCredit;
    @Column(name = "decouponid")
    private Integer decouponId;
    @Column(name = "credit")
    private BigDecimal credit;

    public Boolean getUseDecoupon() {
        return isUseDecoupon;
    }

    public void setUseDecoupon(Boolean useDecoupon) {
        isUseDecoupon = useDecoupon;
    }

    public Boolean getUseCredit() {
        return isUseCredit;
    }

    public void setUseCredit(Boolean useCredit) {
        isUseCredit = useCredit;
    }

    public Integer getDecouponId() {
        return decouponId;
    }

    public void setDecouponId(Integer decouponId) {
        this.decouponId = decouponId;
    }

    public BigDecimal getCredit() {
        return credit;
    }

    public void setCredit(BigDecimal credit) {
        this.credit = credit;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
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

    public Boolean getPaid() {
        return isPaid;
    }

    public void setPaid(Boolean paid) {
        isPaid = paid;
    }

    public Boolean getFinished() {
        return isFinished;
    }

    public void setFinished(Boolean finished) {
        isFinished = finished;
    }
}
