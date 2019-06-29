package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Announcement;

import java.util.Date;
import java.util.List;

public interface AnnouncementRepository extends JpaRepository<Announcement, Integer> {

    Announcement findById(int id);

    List<Announcement> findAll();

    List<Announcement> findAllByGmtCreateBetween(Date start, Date end);

    @Modifying
    @Transactional
    @Query(value = "delete from mm_announcement where id=?1",nativeQuery = true)
    Integer deleteById(int id);

}
