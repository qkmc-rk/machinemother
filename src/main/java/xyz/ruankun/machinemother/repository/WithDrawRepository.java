package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.WithDraw;

import java.util.List;

public interface WithDrawRepository  extends JpaRepository<WithDraw, Integer> {

    WithDraw findById(int id);

    List<WithDraw> findByUserid(Integer userId);

    @Modifying
    @Transactional
    @Query(value = "delete from mm_withdraw where id=?1", nativeQuery = true)
    Integer deleteById(int id);

}
