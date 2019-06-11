package xyz.ruankun.machinemother.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "mm_comment")
@DynamicInsert
@DynamicUpdate
public class Comment {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column
    private Integer itemId;
    @Column
    private Integer userId;
    //1星-5星
    @Column
    private Integer score;
    @Column
    private String comment;
    @Column
    private String picture1;
    @Column
    private String picture2;
    @Column
    private String picture3;
    @Column(name = "gmt_create")
    private Date gmtCreate;
    @Column(name = "gmt_modified")
    private Date gmtModified;
    @Column(name = "is_rcmd")
    private Boolean isRcmd;

    public Comment(Integer itemId) {
        this.itemId = itemId;
    }

    public Comment(Integer itemId, Integer userId, Integer score, String comment, String picture1, String picture2, String picture3, Date gmtCreate, Date gmtModified, Boolean isRcmd) {
        this.itemId = itemId;
        this.userId = userId;
        this.score = score;
        this.comment = comment;
        this.picture1 = picture1;
        this.picture2 = picture2;
        this.picture3 = picture3;
        this.gmtCreate = gmtCreate;
        this.gmtModified = gmtModified;
        this.isRcmd = isRcmd;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getPicture1() {
        return picture1;
    }

    public void setPicture1(String picture1) {
        this.picture1 = picture1;
    }

    public String getPicture2() {
        return picture2;
    }

    public void setPicture2(String picture2) {
        this.picture2 = picture2;
    }

    public String getPicture3() {
        return picture3;
    }

    public void setPicture3(String picture3) {
        this.picture3 = picture3;
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

    public Boolean getRcmd() {
        return isRcmd;
    }

    public void setRcmd(Boolean rcmd) {
        isRcmd = rcmd;
    }
}
