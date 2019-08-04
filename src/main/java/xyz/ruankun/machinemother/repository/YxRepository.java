package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Yingxiao;

public interface YxRepository extends JpaRepository<Yingxiao, Integer> {

    Yingxiao findByProductId(Integer productId);

}
