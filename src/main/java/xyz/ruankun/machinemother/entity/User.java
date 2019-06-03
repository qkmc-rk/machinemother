package xyz.ruankun.machinemother.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

@Entity
@Table(name = "mm_user")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "openid", nullable = false)
    private Integer openId;

    @Column(name = "name")
    private String name;

    @Column(name = "gmt_create", nullable = false)
    private Date gmtCreate;

    @Column(name = "invitor_id")
    private Integer invitorId;

    private String phone;
    private String avator;
    @Column(name = "award", nullable = false)
    private Double award;

    @Column(name = "integration", nullable = false)
    private Double integration;
    @Column(name = "wxid")
    private String wxId;
    @Column(name = "gmtModified", nullable = false)
    private Date gmtModified;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOpenId() {
        return openId;
    }

    public void setOpenId(Integer openId) {
        this.openId = openId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Integer getInvitorId() {
        return invitorId;
    }

    public void setInvitorId(Integer invitorId) {
        this.invitorId = invitorId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvator() {
        return avator;
    }

    public void setAvator(String avator) {
        this.avator = avator;
    }

    public Double getAward() {
        return award;
    }

    public void setAward(Double award) {
        this.award = award;
    }

    public Double getIntegration() {
        return integration;
    }

    public void setIntegration(Double integration) {
        this.integration = integration;
    }

    public String getWxId() {
        return wxId;
    }

    public void setWxId(String wxId) {
        this.wxId = wxId;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", openId=" + openId +
                ", name='" + name + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", invitorId=" + invitorId +
                ", phone='" + phone + '\'' +
                ", avator='" + avator + '\'' +
                ", award=" + award +
                ", integration=" + integration +
                ", wxId='" + wxId + '\'' +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
