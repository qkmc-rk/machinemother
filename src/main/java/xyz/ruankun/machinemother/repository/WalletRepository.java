package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Wallet;

public interface WalletRepository extends JpaRepository<Wallet, Integer> {

    Wallet findByUserId(Integer userId);

    @Modifying
    @Transactional
    @Query(value = "delete from mm_wallet where id=?1", nativeQuery = true)
    Integer deleteById(int id);
}
