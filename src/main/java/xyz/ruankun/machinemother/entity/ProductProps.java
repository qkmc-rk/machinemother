package xyz.ruankun.machinemother.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "mm_productprops")
public class ProductProps {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "productid")
    private Integer productId;
    @Column(name = "servicedate")
    private Integer serviceDate;
    @Column(name = "servicetime")
    private String serviceTime;
    @Column(name = "price")
    private BigDecimal price;

    @Column(name = "is_visible")
    private Boolean isVisible;

    public Boolean getVisible() {
        return isVisible;
    }
    public void setVisible(Boolean visible) {
        isVisible = visible;
    }
    public Boolean getIsVisible() {
        return isVisible;
    }
    public void setIsVisible(Boolean visible) {
        isVisible = visible;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getServiceDate() {
        return serviceDate;
    }

    public void setServiceDate(Integer serviceDate) {
        this.serviceDate = serviceDate;
    }

    public String getServiceTime() {
        return serviceTime;
    }

    public void setServiceTime(String serviceTime) {
        this.serviceTime = serviceTime;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
