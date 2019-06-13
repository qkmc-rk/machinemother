package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Decoupon;

public interface DecouponRepository extends JpaRepository<Decoupon, Integer> {
}
