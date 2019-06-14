package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.CommissionRecord;

import java.util.List;

public interface CommissionRecordRepository extends JpaRepository<CommissionRecord, Integer> {

    List<CommissionRecord> findAllByUserId(Integer userid);
}
