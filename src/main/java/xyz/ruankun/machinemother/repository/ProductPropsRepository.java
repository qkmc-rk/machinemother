package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.ProductProps;

import java.math.BigDecimal;
import java.util.List;

public interface ProductPropsRepository extends JpaRepository<ProductProps, Integer> {

    ProductProps findById(int id);

    @Query(value = "select id, productid, servicedate, servicetime from mm_productprops where id=?1", nativeQuery = true)
    ProductProps getById(int id);

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Query(value = "delete from mm_productprops where productid=?1", nativeQuery = true)
    Integer deleteAllByProductId(int productId);

    @Modifying
    @Transactional(rollbackFor = Exception.class)
    @Query(value = "delete from mm_productprops where id=?1", nativeQuery = true)
    Integer deleteById(int id);

    List<ProductProps> findByProductId(int productId);

}
