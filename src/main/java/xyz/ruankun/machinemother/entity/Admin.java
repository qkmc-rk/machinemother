package xyz.ruankun.machinemother.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Table(name = "mm_admin")
@DynamicInsert
@DynamicUpdate
public class Admin {

    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column
    private String account;

    @Column
    private String password;

    @Column(name = "is_lock")
    private Integer isLock;

    public Admin(Integer id, String account, String password, Integer isLock) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.isLock = isLock;
    }

    public Admin() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getIsLock() {
        return isLock;
    }

    public void setIsLock(Integer isLock) {
        this.isLock = isLock;
    }
}
