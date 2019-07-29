package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.DecouponCDKey;

import java.util.List;
import java.util.Set;

public interface DecouponCDKeyRepository extends JpaRepository<DecouponCDKey, Integer> {

    Set<DecouponCDKey> findAllByIsExchanged(Boolean exchanged);

    DecouponCDKey findByCdkey(String decouponKey);
}
