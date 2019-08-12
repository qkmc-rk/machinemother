package xyz.ruankun.machinemother.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.*;
import xyz.ruankun.machinemother.repository.*;
import xyz.ruankun.machinemother.service.ProductService;
import xyz.ruankun.machinemother.util.DataCode;
import xyz.ruankun.machinemother.util.EntityUtil;

import javax.annotation.Resource;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Resource
    private ProductRepository productRepository;

    @Resource
    private YxRepository yxRepository;

    @Resource
    private ProductPropsRepository productPropsRepository;

    @Resource
    private DictProductTypeRepository dictProductTypeRepository;

    @Resource
    private ItemRepository itemRepository;

    @Transactional(rollbackFor = Exception.class)
    @Override
    public Boolean addProduct(Product product, List<ProductProps> productProps) {
        try {
            product.setIsVisible(true);
            productRepository.save(product);        //先保存product
            for (ProductProps props : productProps) {
                props.setProductId(product.getId());        //依次修改props的productId
                props.setIsVisible(true);
            }
            //添加营销表数据，默认 count为0
            Yingxiao  data = new Yingxiao();
            data.setProductId(product.getId());
            data.setCount(0);
            yxRepository.save(data);

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
                        //添加营销数据
                        Yingxiao data = yxRepository.findByProductId(productId);
                        if(data != null){
                            product.setMonthSold(data.getCount());
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        product.setSoldNumber(0);
//                        product.setMonthSold();
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
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateProduct(Product product) {
        Product check = getProduct(product.getId());
        if (check == null || check.getId() == 0 ||!check.getIsVisible()) {
            return false;
        } else {
            try {
                //如果product的营销数量正确且已改变,则更新
                if(product.getMonthSold() != null && product.getMonthSold()>0){
                    Yingxiao data = yxRepository.findByProductId(product.getId());
                    if(!data.getCount().equals(product.getMonthSold()) && data !=null) {
                        data.setCount(product.getMonthSold());
                        yxRepository.save(data);
                    }
                }
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
    @Transactional(rollbackFor = Exception.class)
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
    public Boolean updateYx(Integer productId, Integer count) {
        if(productRepository.findById(productId.intValue()) != null ) {
            Yingxiao data = yxRepository.findByProductId(productId);
            if (data != null) {
                data.setCount(count);
                try {
                    yxRepository.save(data);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return true;
            }
        }
            return false;
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
