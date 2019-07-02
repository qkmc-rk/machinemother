package xyz.ruankun.machinemother.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "mm_decoupon")
public class Decoupon {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "userid")
    private Integer userId;
    private Date gmtCreate;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date gmtPast;
    private Boolean isUsed;
    private Boolean isPast;
    private BigDecimal min;
    private BigDecimal worth;
    private Boolean isFromexchange;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userId;
    }

    public void setUserid(Integer userId) {
        this.userId = userId;
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

    public Boolean getUsed() {
        return isUsed;
    }

    public void setUsed(Boolean used) {
        isUsed = used;
    }

    public Boolean getPast() {
        return isPast;
    }

    public void setPast(Boolean past) {
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

    public Boolean getFromexchange() {
        return isFromexchange;
    }

    public void setFromexchange(Boolean fromexchange) {


        isFromexchange = fromexchange;
    }

    @Override
    public String toString() {
        return "Decoupon{" +
                "id=" + id +
                ", userId=" + userId +
                ", gmtCreate=" + gmtCreate +
                ", gmtPast=" + gmtPast +
                ", isUsed=" + isUsed +
                ", isPast=" + isPast +
                ", min=" + min +
                ", worth=" + worth +
                ", isFromexchange=" + isFromexchange +
                '}';
    }
}
