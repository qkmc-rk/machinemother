package xyz.ruankun.machinemother.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "mm_item")
@DynamicInsert
@DynamicUpdate
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "productid")
    private Integer productId;
    @Column(name = "productpropsid")
    private Integer productPropsId;  //由producttypeid改为 productPropsId

    private Integer quantity;
    @Column(name = "orderid")      //通过column 映射，改一下变量名就好了
    private String orderNumber; //注意一下这里的orderid不是order的id，是ordernumber，设计缺陷，不想改了
    private Date gmtCreate;
    private Date gmtModified;
    @Column(name = "userid")
    private Integer userId;

    @Column(name = "isComment")
    private Boolean isComment;

    //transient
    @Transient
    private Comment commentInfo;
    @Transient
    private Product product;
    @Transient
    private ProductProps productProps;

    public Comment getCommentInfo() {
        return commentInfo;
    }

    public void setCommentInfo(Comment commentInfo) {
        this.commentInfo = commentInfo;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductProps getProductProps() {
        return productProps;
    }

    public void setProductProps(ProductProps productProps) {
        this.productProps = productProps;
    }

    public Boolean getComment() {
        return isComment;
    }

    public void setComment(Boolean comment) {
        isComment = comment;
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

    public Integer getProductPropsId() {
        return productPropsId;
    }

    public void setProductPropsId(Integer productTypeId) {
        this.productPropsId = productTypeId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
