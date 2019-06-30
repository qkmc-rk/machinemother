package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Decoupon;

import java.util.List;

public interface DecouponRepository extends JpaRepository<Decoupon, Integer> {

    Decoupon findById(int id);

    List<Decoupon> findAllByUserId(Integer userid);

    Integer countByUserIdAndAndIsPastAndAndIsUsed(Integer userId, Boolean past, Boolean used);
}
