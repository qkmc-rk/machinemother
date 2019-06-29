package xyz.ruankun.machinemother.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import xyz.ruankun.machinemother.entity.User;


import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {

    User save(User user);

    User findById(int id);

    User findByWxId(String wxId);

    User findByPhone(String phone);

    User findByOpenId(String openId);

    Page<User> findByName(String name, Pageable pageable);

    Page<User> findByNameLike(String name, Pageable pageable);

//    List<User> findTopByIntegration();

    @Modifying
    @Query(value = "delete from mm_user where openid=?1", nativeQuery = true)
    @Transactional
    Integer deleteByOpenId(String openId);

    @Modifying
    @Query(value = "delete from mm_user where id=?1", nativeQuery = true)
    @Transactional
    Integer deleteById(int id);

//    Boolean deleteById(int id);

//    int deleteByName(String name);
//
//    int deleteByInvitorId(int invitorId);

    List<User> findByInvitorId(Integer invitorId);

    Page<User> findByInvitorId(Integer invitorId, Pageable pageable);

    Page<User> findAll(Pageable pageable);

    int countByInvitorId(int invitorId);


}
