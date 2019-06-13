package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Wallet;

public interface WalletRepository extends JpaRepository<Wallet, Integer> {
}
