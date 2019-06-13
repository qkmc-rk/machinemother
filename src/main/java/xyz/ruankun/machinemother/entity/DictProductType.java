package xyz.ruankun.machinemother.entity;

import javax.persistence.*;

@Entity
@Table(name = "mm_dict_producttype")
public class DictProductType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    private String type;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
