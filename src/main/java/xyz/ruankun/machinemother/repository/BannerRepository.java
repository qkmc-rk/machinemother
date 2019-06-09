package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Banner;

import java.util.List;

public interface BannerRepository extends JpaRepository<Banner,Integer> {

    /**
     * 找到所有可以用以显示的banner
     * @return banner list
     */
    List<Banner> findAllByIsVisibleTrue();
}
