package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.DictProductType;
import xyz.ruankun.machinemother.entity.Product;
import xyz.ruankun.machinemother.entity.ProductProps;
import xyz.ruankun.machinemother.entity.Yingxiao;

import java.util.List;

public interface ProductService {

    Boolean addProduct(Product product, List<ProductProps> productProps);

    Product getProduct(int id);

    Boolean updateProduct(Product product);

    List<Product> getProducts();

    List<Product> getProductsByTypeId(int typeId);

    List<ProductProps> getProps(int id);

    Integer deleteProduct(Integer id);

    Boolean updateYx(Integer productId, Integer count);

    DictProductType getProductType(String type);

    DictProductType getProductType(int id);

    List<DictProductType> getTypes();
}
