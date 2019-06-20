package xyz.ruankun.machinemother.service;

import xyz.ruankun.machinemother.entity.DictProductType;
import xyz.ruankun.machinemother.entity.Product;
import xyz.ruankun.machinemother.entity.ProductProps;

import java.util.List;

public interface ProductService {

    Boolean addProduct(Product product, List<ProductProps> productProps);

    Product getProduct(int id);

    Boolean updateProduct(Product product);

    List<Product> getProducts();

    List<Product> getProductsByTypeId(int typeId);

    List<ProductProps> getProps(int id);

    Boolean deleteProduct(int id);

    DictProductType getProductType(String type);

    DictProductType getProductType(int id);

    List<DictProductType> getTypes();
}
