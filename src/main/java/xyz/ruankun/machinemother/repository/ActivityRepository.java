package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Activity;

import java.util.Date;
import java.util.List;

public interface ActivityRepository extends JpaRepository<Activity,Integer> {

    List<Activity> findAll();

    List<Activity> findAllByStartAfterAndEndBefore(Date start, Date end);

    List<Activity> findAllByEndBefore(Date date);

}
