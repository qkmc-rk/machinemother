package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Decoupon;

import java.util.List;

public interface DecouponRepository extends JpaRepository<Decoupon, Integer> {

    List<Decoupon> findAllByUserId(Integer userid);
}
