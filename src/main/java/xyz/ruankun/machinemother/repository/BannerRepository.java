package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.Banner;

import java.util.List;

public interface BannerRepository extends JpaRepository<Banner,Integer> {

    /**
     * 找到所有可以用以显示的banner
     * @return banner list
     */
    List<Banner> findAllByIsVisibleTrue();

    @Modifying
    @Query(value = "delete from mm_index_banner where id=?1", nativeQuery = true)
    @Transactional
    Integer deleteById(int id);
}
