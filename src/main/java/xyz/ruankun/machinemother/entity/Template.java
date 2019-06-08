package xyz.ruankun.machinemother.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 此template并非模板，而是一张图片。
 */
@Entity
@Table(name = "mm_sharetemplate")
@DynamicInsert
@DynamicUpdate
public class Template {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column
    private String imgpath;

    public Template() {
    }

    public Template(String imgpath) {
        this.imgpath = imgpath;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }
}
