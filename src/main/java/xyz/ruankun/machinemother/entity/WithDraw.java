package xyz.ruankun.machinemother.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "mm_withdraw")
public class WithDraw {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private Integer userid;
    private String recnum;
    private BigDecimal amount;
    private Boolean isConfirm;
    private Boolean isFailed;
    private Date gmtCreate;
    private Date gmtModified;
    private String ordernum;

    public WithDraw() {
    }

    public WithDraw(Integer userid, String recnum, BigDecimal amount, Boolean isConfirm, Boolean isFailed, Date gmtCreate, Date gmtModified) {
        this.userid = userid;
        this.recnum = recnum;
        this.amount = amount;
        this.isConfirm = isConfirm;
        this.isFailed = isFailed;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
    }

    public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getRecnum() {
        return recnum;
    }

    public void setRecnum(String recnum) {
        this.recnum = recnum;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Boolean getConfirm() {
        return isConfirm;
    }

    public void setConfirm(Boolean confirm) {
        isConfirm = confirm;
    }

    public Boolean getFailed() {
        return isFailed;
    }

    public void setFailed(Boolean failed) {
        isFailed = failed;
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

    @Override
    public String toString() {
        return "WithDraw{" +
                "id=" + id +
                ", userid=" + userid +
                ", recnum='" + recnum + '\'' +
                ", amount=" + amount +
                ", isConfirm=" + isConfirm +
                ", isFailed=" + isFailed +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", ordernum='" + ordernum + '\'' +
                '}';
    }
}
