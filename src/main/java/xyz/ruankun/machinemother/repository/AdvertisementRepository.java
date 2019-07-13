package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Advertisement;

import java.util.List;

public interface AdvertisementRepository extends JpaRepository<Advertisement,Integer> {

    Advertisement findById(int id);

    List<Advertisement> findAllByIsVisible(Boolean isVisible);

    @Modifying
    @Transactional
    @Query(value = "delete from mm_index_advertisement where id=?1", nativeQuery = true)
    Integer deleteById(int id);

}
