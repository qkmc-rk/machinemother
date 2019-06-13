package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Announcement;

import java.util.List;

public interface AnnouncementRepository extends JpaRepository<Announcement, Integer> {

    List<Announcement> findAll();
}
