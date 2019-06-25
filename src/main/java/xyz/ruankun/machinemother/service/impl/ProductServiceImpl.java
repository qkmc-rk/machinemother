package xyz.ruankun.machinemother.service.impl;

import org.springframework.stereotype.Service;
import xyz.ruankun.machinemother.entity.DictProductType;
import xyz.ruankun.machinemother.entity.Product;
import xyz.ruankun.machinemother.entity.ProductProps;
import xyz.ruankun.machinemother.repository.DictProductTypeRepository;
import xyz.ruankun.machinemother.repository.ProductPropsRepository;
import xyz.ruankun.machinemother.repository.ProductRepository;
import xyz.ruankun.machinemother.service.ProductService;
import xyz.ruankun.machinemother.util.EntityUtil;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductRepository productRepository;

    @Resource
    private ProductPropsRepository productPropsRepository;

    @Resource
    private DictProductTypeRepository dictProductTypeRepository;

    @Override
    public Boolean addProduct(Product product, List<ProductProps> productProps) {
        try{
            productRepository.save(product);        //先保存product
            for(ProductProps props : productProps){
                props.setProductId(product.getId());        //依次修改props的productId
            }
            productPropsRepository.saveAll(productProps);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Product getProduct(int id) {
        return productRepository.getOne(id);
    }

    @Override
    public Boolean updateProduct(Product product) {
        Product check = getProduct(product.getId());
        if(check == null){
            return false;
        }else{
            try {
                product.setGmtModefied(new Date());
                EntityUtil.update(product, check );
                productRepository.save(product);
                return true;
            }catch (Exception e){
                e.printStackTrace();
                return false;
            }
        }
    }

    @Override
    public List<Product> getProducts() {
        return productRepository.findAll();
    }

    @Override
    public Boolean deleteProduct(int id) {
        if(getProduct(id) == null){
            return false;
        }else{
            try {
                productRepository.deleteById(id);
                productPropsRepository.deleteAllByProductId(id);
                return true;
            }catch (Exception e){
                e.printStackTrace();
                return false;
            }
        }

    }

    @Override
    public DictProductType getProductType(String type) {
        return dictProductTypeRepository.findByType(type);
    }

    @Override
    public DictProductType getProductType(int id) {
        return dictProductTypeRepository.findById(id);
    }

    @Override
    public List<Product> getProductsByTypeId(int typeId) {
        return productRepository.findByTypeId(typeId);
    }

    @Override
    public List<DictProductType> getTypes() {
        return dictProductTypeRepository.findAll();
    }

    @Override
    public List<ProductProps> getProps(int id) {
        return productPropsRepository.findByProductId(id);
    }
}
