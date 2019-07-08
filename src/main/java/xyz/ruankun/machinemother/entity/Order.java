package xyz.ruankun.machinemother.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

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
    private Boolean useDecoupon;
    @Column(name = "is_usecredit")
    private Boolean useCredit;
    @Column(name = "decouponid")
    private Integer decouponId;
    @Column(name = "credit")
    private BigDecimal credit;
    private Integer addrId;
    //transient props
    @Transient
    private List<Item> items;
    @Transient
    private String indentStatus;

    public String getIndentStatus() {
        return indentStatus;
    }

    public void setIndentStatus(String indentStatus) {
        this.indentStatus = indentStatus;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Integer getAddrId() {
        return addrId;
    }
    public void setAddrId(Integer addrId) {
        this.addrId = addrId;
    }

    public Boolean getUseDecoupon() {
        return useDecoupon;
    }

    public void setUseDecoupon(Boolean useDecoupon) {
        this.useDecoupon = useDecoupon;
    }

    public Boolean getUseCredit() {
        return useCredit;
    }

    public void setUseCredit(Boolean useCredit) {
        this.useCredit = useCredit;
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

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userId=" + userId +
                ", orderNumber='" + orderNumber + '\'' +
                ", amount=" + amount +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", isPaid=" + isPaid +
                ", isFinished=" + isFinished +
                ", useDecoupon=" + useDecoupon +
                ", useCredit=" + useCredit +
                ", decouponId=" + decouponId +
                ", credit=" + credit +
                ", addrId=" + addrId +
                '}';
    }
}
