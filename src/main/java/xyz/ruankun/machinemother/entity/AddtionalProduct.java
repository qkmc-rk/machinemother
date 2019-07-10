package xyz.ruankun.machinemother.entity;

import java.util.List;

public class AddtionalProduct {

    private Product product;

    private List<ProductProps> productProps;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<ProductProps> getProductProps() {
        return productProps;
    }

    public void setProductProps(List<ProductProps> productProps) {
        this.productProps = productProps;
    }
}
