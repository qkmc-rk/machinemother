package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.ProductProps;

import java.util.List;

public interface ProductPropsRepository extends JpaRepository<ProductProps, Integer> {

    int deleteByProductId(int productId);

    List<ProductProps> findByProductId(int productId);
}
