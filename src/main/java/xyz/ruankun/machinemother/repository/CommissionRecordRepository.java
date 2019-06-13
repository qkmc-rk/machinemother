package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.CommissionRecord;

public interface CommissionRecordRepository extends JpaRepository<CommissionRecord, Integer> {
}
