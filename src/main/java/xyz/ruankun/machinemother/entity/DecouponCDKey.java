package xyz.ruankun.machinemother.entity;

import com.sun.org.apache.xpath.internal.operations.Bool;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "mm_decouponcdkey")
public class DecouponCDKey {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String cdkey;
    private Date gmtCreate;
    private Date gmtPast;
    private Boolean isExchanged;
    private boolean isPast;
    private BigDecimal min;
    private BigDecimal worth;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCdkey() {
        return cdkey;
    }

    public void setCdkey(String cdkey) {
        this.cdkey = cdkey;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtPast() {
        return gmtPast;
    }

    public void setGmtPast(Date gmtPast) {
        this.gmtPast = gmtPast;
    }

    public Boolean getExchanged() {
        return isExchanged;
    }

    public void setExchanged(Boolean exchanged) {
        isExchanged = exchanged;
    }

    public boolean isPast() {
        return isPast;
    }

    public void setPast(boolean past) {
        isPast = past;
    }

    public BigDecimal getMin() {
        return min;
    }

    public void setMin(BigDecimal min) {
        this.min = min;
    }

    public BigDecimal getWorth() {
        return worth;
    }

    public void setWorth(BigDecimal worth) {
        this.worth = worth;
    }
}
