package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.CreditRecord;

public interface CreditRecordRepository extends JpaRepository<CreditRecord, Integer> {
}
