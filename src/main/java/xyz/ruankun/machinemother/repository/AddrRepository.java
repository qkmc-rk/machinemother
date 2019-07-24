package xyz.ruankun.machinemother.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
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

    Page<Addr> findAllByIsVisible(Pageable pageable, Boolean visible);

    @Query(value = "delete from mm_addr where userid=?1", nativeQuery = true)
    @Transactional
    @Modifying
    Integer deleteByUserId(int userId);

    @Query(value = "delete from mm_addr where id=?1", nativeQuery = true)
    @Transactional
    @Modifying
    Integer deleteById(int id);
}
