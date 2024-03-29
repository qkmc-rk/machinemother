package xyz.ruankun.machinemother.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Map;

@Entity
@Table(name = "mm_user")
@DynamicInsert
@DynamicUpdate
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "openid", nullable = false)
    private String openId;

    @Column(name = "name")
    private String name;

    @Column(name = "gmt_create")
    private Date gmtCreate;

    @Column(name = "invitor_id")
    private Integer invitorId;

    private String phone;
    private String avator;
    @Column(name = "award")
    private Double award;

    @Column(name = "integration")
    private Integer integration;
    @Column(name = "wxid")
    private String wxId;
    //修改by mrruan
    @Column(name = "gmt_modified")
    private Date gmtModified;

    @Column(name = "ordered")
    private Boolean ordered;

    @Column(name = "is_black")
    private Boolean isBlack = false;  //初始化

    public Boolean getBlack() {
        return isBlack;
    }

    public void setIsBlack(Boolean black) {
        isBlack = black;
    }

    public Boolean getIsBlack() {
        return isBlack;
    }

    public void setBlack(Boolean black) {
        isBlack = black;
    }

    @Transient
    private Map<String,Integer> extras;

    public Map<String, Integer> getExtras() {
        return extras;
    }

    public void setExtras(Map<String, Integer> extras) {
        this.extras = extras;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
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

    public Integer getIntegration() {
        return integration;
    }

    public void setIntegration(Integer integration) {
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

    public Boolean getOrdered() {
        return ordered;
    }

    public void setOrdered(Boolean ordered) {
        this.ordered = ordered;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", openId='" + openId + '\'' +
                ", name='" + name + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", invitorId=" + invitorId +
                ", phone='" + phone + '\'' +
                ", avator='" + avator + '\'' +
                ", award=" + award +
                ", integration=" + integration +
                ", wxId='" + wxId + '\'' +
                ", gmtModified=" + gmtModified +
                ", ordered=" + ordered +
                ", isBlack=" + isBlack +
                ", extras=" + extras +
                '}';
    }
}
