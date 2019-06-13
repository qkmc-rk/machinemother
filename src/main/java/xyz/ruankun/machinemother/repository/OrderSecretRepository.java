package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.OrderSecret;

public interface OrderSecretRepository extends JpaRepository<OrderSecret, Integer> {
}
