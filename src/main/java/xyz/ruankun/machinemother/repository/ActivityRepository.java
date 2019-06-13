package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Activity;

public interface ActivityRepository extends JpaRepository<Activity,Integer> {

}
