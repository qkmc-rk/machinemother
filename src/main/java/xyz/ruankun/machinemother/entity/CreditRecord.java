package xyz.ruankun.machinemother.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "mm_creditrecord")
public class CreditRecord {
    private Integer id;
    @Column(name = "userid")
    private Integer userId;
    private Date gmtCreate;
    private Integer amount;
    private Boolean isSave;

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

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Boolean getSave() {
        return isSave;
    }

    public void setSave(Boolean save) {
        isSave = save;
    }
}
