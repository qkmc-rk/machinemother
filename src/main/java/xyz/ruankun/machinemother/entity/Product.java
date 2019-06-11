package xyz.ruankun.machinemother.entity;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "mm_product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "typeid")
    private Integer typeId;
    private String title;
    private String content;
    private Date gmtCreate;
    private Date gmtModefied;

    public Product() {
    }

    public Product(Integer typeId, String title, String content, Date gmtCreate, Date gmtModefied) {
        this.typeId = typeId;
        this.title = title;
        this.content = content;
        this.gmtCreate = gmtCreate;
        this.gmtModefied = gmtModefied;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModefied() {
        return gmtModefied;
    }

    public void setGmtModefied(Date gmtModefied) {
        this.gmtModefied = gmtModefied;
    }
}
