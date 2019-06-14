package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.DecouponCDKey;

import java.util.List;

public interface DecouponCDKeyRepository extends JpaRepository<DecouponCDKey, Integer> {

    DecouponCDKey findByCdkey(String decouponKey);
}
