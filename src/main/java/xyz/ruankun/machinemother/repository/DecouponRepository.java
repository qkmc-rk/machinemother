package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Decoupon;

import java.util.List;
import java.util.Set;

public interface DecouponRepository extends JpaRepository<Decoupon, Integer> {

    Decoupon findById(int id);

    Set<Decoupon> findAllByIsUsedAndIsPast(Boolean used, Boolean past);

    List<Decoupon> findAllByUserId(Integer userid);

    Integer countByUserIdAndAndIsPastAndAndIsUsed(Integer userId, Boolean past, Boolean used);
}
