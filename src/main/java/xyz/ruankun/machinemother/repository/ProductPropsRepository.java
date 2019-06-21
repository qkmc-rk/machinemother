package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.ProductProps;

import java.math.BigDecimal;
import java.util.List;

public interface ProductPropsRepository extends JpaRepository<ProductProps, Integer> {

    int deleteAllByProductId(int productId);

    List<ProductProps> findByProductId(int productId);

}
