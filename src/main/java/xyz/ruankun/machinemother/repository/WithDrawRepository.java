package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.WithDraw;

import java.util.List;

public interface WithDrawRepository  extends JpaRepository<WithDraw, Integer> {

    List<WithDraw> findByUserid(Integer userId);

    Boolean deleteById(int id);

}
