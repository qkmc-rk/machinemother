package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.CreditRecord;

import java.util.List;

public interface CreditRecordRepository extends JpaRepository<CreditRecord, Integer> {

    List<CreditRecord> findAllByUserId(Integer userId);
}
