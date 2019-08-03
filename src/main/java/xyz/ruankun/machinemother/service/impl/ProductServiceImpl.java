package xyz.ruankun.machinemother.service.impl;

import org.apache.tomcat.jni.Local;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.DictProductType;
import xyz.ruankun.machinemother.entity.Item;
import xyz.ruankun.machinemother.entity.Product;
import xyz.ruankun.machinemother.entity.ProductProps;
import xyz.ruankun.machinemother.repository.DictProductTypeRepository;
import xyz.ruankun.machinemother.repository.ItemRepository;
import xyz.ruankun.machinemother.repository.ProductPropsRepository;
import xyz.ruankun.machinemother.repository.ProductRepository;
import xyz.ruankun.machinemother.service.ProductService;
import xyz.ruankun.machinemother.util.DataCode;
import xyz.ruankun.machinemother.util.EntityUtil;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
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

    @Resource
    private ItemRepository itemRepository;

    @Transactional
    @Override
    public Boolean addProduct(Product product, List<ProductProps> productProps) {
        try {
            product.setIsVisible(true);
            productRepository.save(product);        //先保存product
            for (ProductProps props : productProps) {
                props.setProductId(product.getId());        //依次修改props的productId
                props.setIsVisible(true);
            }
            productPropsRepository.saveAll(productProps);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Product getProduct(int id) {
        try {
            Product product = productRepository.findById(id);
            if (product == null) {
                product = new Product();
                product.setId(0);
            }else{
                //真正地找到了product，找到product后还要找到对应的销量
                //销量在item中orderNum不为空的数量
                Integer productId = product.getId();
                if (productId != null && productId.intValue() > 0){
                    //存在定律
                    try {
                        Integer count = itemRepository.countByProductIdIsAndOrderNumberIsNotNull(productId);
                        product.setSoldNumber(count);
                    } catch (Exception e) {
                        e.printStackTrace();
                        product.setSoldNumber(0);
                    }
                }
            }
            return product;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Boolean updateProduct(Product product) {
        Product check = getProduct(product.getId());
        if (check == null || check.getId() == 0 ||!check.getIsVisible()) {
            return false;
        } else {
            try {
                product.setGmtModified(new Date());
                EntityUtil.update(product, check);
                productRepository.save(product);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
    }

    @Override
    public List<Product> getProducts() {
        System.out.println("记录查询产品时间：" + LocalTime.now());
        List<Product> products = productRepository.findAll();
        System.out.println("记录从数据库查询产品完成时间：" + LocalTime.now());
        List<Product> products1 = new ArrayList<>();
        for (Product p :
                products) {
            if (p.getIsVisible())
                products1.add(p);
        }
        System.out.println("记录查询产品完成时间：" + LocalTime.now());
        return products1;
    }

    @Override
    @Transactional
    public Integer deleteProduct(Integer id) {
        Product product = getProduct(id);
        if (product == null || product.getId() == 0||! product.getIsVisible()) {
            return DataCode.DATA_CONFLIC;
        } else {
            try {
                product.setIsVisible(false);
                Product result = productRepository.saveAndFlush(product);
                //Integer result1 = productPropsRepository.deleteAllByProductId(id.intValue());
                if (result != null) {
                    try {
                        throw new Exception(" 有数据未删除完成，product:" + result);
                    } catch (Exception e) {
                        e.printStackTrace();
                        return DataCode.DATA_CONFLIC;
                    }
                } else {
                    return DataCode.DATA_OPERATION_SUCCESS;
                }
            } catch (Exception e) {
                e.printStackTrace();
                return DataCode.DATA_OPERATION_ERROR;
            }
        }

    }

    @Override
    public DictProductType getProductType(String type) {
        try {
            DictProductType dictProductType = dictProductTypeRepository.findByType(type);
            if (dictProductType == null) {
                dictProductType = new DictProductType();
                dictProductType.setId(0);
            }
            return dictProductType;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public DictProductType getProductType(int id) {
        try {
            DictProductType dictProductType = dictProductTypeRepository.findById(id);
            if (dictProductType == null) {
                dictProductType = new DictProductType();
                dictProductType.setId(0);
            }
            return dictProductType;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Product> getProductsByTypeId(int typeId) {
       List<Product> products =  productRepository.findByTypeId(typeId);
       List<Product> products1 = new ArrayList<>();
       for (Product p:products){
           if (p.getIsVisible())
               products1.add(p);
       }
       return products1;
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
