package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Product;

import java.util.Date;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    Product save(Product product);

    Product findById(int id);

    List<Product> findByTypeId(int typeId);

    //模糊查找
    List<Product> findByTitleLike(String title);

    //查看新品
    List<Product> getAllOrderByGmtCreate(Date gmtCreate);

}
