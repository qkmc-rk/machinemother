package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.DictProductType;

public interface DictProductTypeRepository extends JpaRepository<DictProductType, Integer> {
}
