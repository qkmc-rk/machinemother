package xyz.ruankun.machinemother.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "mm_order")
public class Order implements Serializable {
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
    private Boolean isDelete;
    private Boolean isCancle;

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
    //订单备注
    @Column(name = "tip")
    private String tip = "无";
    //transient props
//    @OneToMany(mappedBy = "orderNumber")
//    @JoinColumn(name = "ordernumber", referencedColumnName = "orderid")
    @Transient
    private List<Item> items;
    @Transient
    private String indentStatus;
    @Transient
    private Addr addr;
    @Transient
    private Integer allPage;

    public Integer getAllPage() {
        return allPage;
    }

    public void setAllPage(Integer allPage) {
        this.allPage = allPage;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public Addr getAddr() {
        return addr;
    }

    public void setAddr(Addr addr) {
        this.addr = addr;
    }

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

    public Boolean getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(Boolean paid) {
        isPaid = paid;
    }

    public Boolean getIsFinished() {
        return isFinished;
    }

    public void setIsFinished(Boolean finished) {
        isFinished = finished;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean delete) {
        isDelete = delete;
    }

    public Boolean getIsCancle() {
        return isCancle;
    }

    public void setIsCancle(Boolean cancle) {
        isCancle = cancle;
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
                ", tip=" + tip +
                '}';
    }

    public String toStringByProduct(){

        StringBuilder stringBuilder = new StringBuilder();
        if (items != null){
            for (int i=0; i<items.size(); i++){
                stringBuilder.append(i);
                stringBuilder.append(".\r\nid:" + items.get(i).getProduct().getId());
                stringBuilder.append(", 名称:");
                stringBuilder.append(items.get(i).getProduct().getTitle());
                stringBuilder.append(", 简介:");
                stringBuilder.append(items.get(i).getProduct().getIntro());
                stringBuilder.append("   \r\n");
                stringBuilder.append("    属性:" + items.get(i).getProductProps().toString());
            }
            return stringBuilder.toString();
        }else {
            return "no any items";
        }
    }
}
