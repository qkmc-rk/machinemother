package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Activity;

import java.util.Date;
import java.util.List;

public interface ActivityRepository extends JpaRepository<Activity,Integer> {

    Activity findById(int id);

    List<Activity> findAll();

    List<Activity> findAllByStartAfterAndEndBefore(Date start, Date end);

    List<Activity> findAllByEndBefore(Date date);

    @Modifying
    @Query(value = "delete from mm_activity where id=?1", nativeQuery = true)
    @Transactional
    Integer deleteById(int id);

}
