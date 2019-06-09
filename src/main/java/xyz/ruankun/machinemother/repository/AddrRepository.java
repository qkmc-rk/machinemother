package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.Addr;

import java.util.List;

public interface AddrRepository extends JpaRepository<Addr,Integer> {

    /**
     * 通过userid查询所有的符合该用户的地址信息
     * @return
     */
    List<Addr> findAllByUserId(Integer userId);

    Addr save(Addr addr);

    Addr findById(int id);

    int deleteByUserId(int userId);

    int deleteById(int id);


}
