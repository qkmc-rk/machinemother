package xyz.ruankun.machinemother.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import xyz.ruankun.machinemother.entity.User;

import java.math.BigInteger;
import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {

    User save(User user);

    User findById(int id);

    User findByWxId(String wxId);

    User findByPhone(String phone);

    List<User> findByName(String name);

    List<User> findByNameLike(String name);

    List<User> findByOrderByIntegrationDesc();

    List<User> findTop3ByNameLikeOrderByAwardDesc(String name);
//
//    List<User> findTopByIntegration();

    int deleteByOpenId(int openId);

    int deleteById(int id);

    int deleteByName(String name);

    int deleteByPhone(String phone);

    int deleteByWxId(String wxId);

    int deleteByInvitorId(int invitorId);

    List<User> findUsersByInvitorId(int invitorId);

    List<User> findAll();

    int countByInvitorId(int invitorId);



}
